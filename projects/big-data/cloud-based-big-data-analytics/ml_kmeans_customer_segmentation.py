from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count as f_count, sum as f_sum, avg as f_avg, countDistinct
from pyspark.ml.feature import VectorAssembler, StandardScaler
from pyspark.ml.clustering import KMeans
from pyspark.ml.evaluation import ClusteringEvaluator

BUCKET = "gs://retail-dataset-bucket12"
PARQUET_TXN = f"{BUCKET}/parquet/transactions"
OUT_BASE = f"{BUCKET}/exports/bigdata-retail-assignment/ml"

spark = SparkSession.builder.appName("Retail-ML-KMeans-Segmentation").getOrCreate()

# 1) Load transactions (Parquet created earlier)
tx = spark.read.parquet(PARQUET_TXN)

# Ensure correct types
tx = (tx
      .withColumn("CustomerID", col("CustomerID").cast("string"))
      .withColumn("ProductID", col("ProductID").cast("string"))
      .withColumn("Amount", col("Amount").cast("double"))
)

# 2) Build customer-level features
# - txn_count: number of transactions
# - total_amount: total spend
# - avg_amount: average transaction amount
# - unique_products: product variety
cust = (tx.groupBy("CustomerID")
          .agg(
              f_count("*").alias("txn_count"),
              f_sum("Amount").alias("total_amount"),
              f_avg("Amount").alias("avg_amount"),
              countDistinct("ProductID").alias("unique_products")
          )
          .na.fill(0)
)

# 3) Assemble features
feature_cols = ["txn_count", "total_amount", "avg_amount", "unique_products"]
assembler = VectorAssembler(inputCols=feature_cols, outputCol="features_raw")
cust_vec = assembler.transform(cust)

# 4) Scale features (helps KMeans)
scaler = StandardScaler(inputCol="features_raw", outputCol="features", withStd=True, withMean=True)
scaler_model = scaler.fit(cust_vec)
cust_scaled = scaler_model.transform(cust_vec)

# 5) Try multiple K and pick best by Silhouette
evaluator = ClusteringEvaluator(featuresCol="features", predictionCol="prediction",
                                metricName="silhouette", distanceMeasure="squaredEuclidean")

best_k = None
best_score = -1.0
best_model = None

for k in [2, 3, 4, 5, 6]:
    kmeans = KMeans(k=k, seed=42, featuresCol="features", predictionCol="prediction")
    model = kmeans.fit(cust_scaled)
    preds = model.transform(cust_scaled)
    score = evaluator.evaluate(preds)
    print(f"K={k}  silhouette={score}")
    if score > best_score:
        best_score = score
        best_k = k
        best_model = model

print("\n=== BEST MODEL ===")
print(f"Best K: {best_k}")
print(f"Best silhouette: {best_score}")

# 6) Final predictions with best model
final_preds = best_model.transform(cust_scaled)

# 7) Cluster profiling (business-friendly summary)
profile = (final_preds.groupBy("prediction")
           .agg(
               f_count("*").alias("num_customers"),
               f_avg("txn_count").alias("avg_txn_count"),
               f_avg("total_amount").alias("avg_total_amount"),
               f_avg("avg_amount").alias("avg_amount"),
               f_avg("unique_products").alias("avg_unique_products")
           )
           .orderBy("prediction"))

print("\n=== CLUSTER PROFILE (means) ===")
profile.show(truncate=False)

# 8) Save outputs to GCS for report/GitHub evidence
(final_preds
 .select("CustomerID", "txn_count", "total_amount", "avg_amount", "unique_products", "prediction")
 .write.mode("overwrite").parquet(f"{OUT_BASE}/customer_clusters_parquet"))

(profile
 .coalesce(1)
 .write.mode("overwrite").option("header", "true").csv(f"{OUT_BASE}/cluster_profile_csv"))

spark.stop()
