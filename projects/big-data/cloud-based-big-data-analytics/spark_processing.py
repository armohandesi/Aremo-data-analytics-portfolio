from pyspark.sql import SparkSession
from pyspark.sql.functions import col

BUCKET = "gs://retail-dataset-bucket12"

spark = SparkSession.builder.appName("RetailSparkProcessing").getOrCreate()

transactions = spark.read.option("header", "true").csv(f"{BUCKET}/store_transactions.csv")
customers = spark.read.option("header", "true").csv(f"{BUCKET}/store_customers.csv")

print("=== COUNTS ===")
print("Transactions count:", transactions.count())
print("Customers count:", customers.count())

print("\n=== TRANSACTIONS SCHEMA ===")
transactions.printSchema()

print("\n=== CUSTOMERS SCHEMA ===")
customers.printSchema()

# Align with actual schema: CustomerID, ProductID, Amount, Date
transactions_sel = transactions.select("CustomerID", "ProductID", "Amount", "Date")
transactions_clean = transactions_sel.withColumn("Amount", col("Amount").cast("double"))

# Write Parquet
transactions_clean.write.mode("overwrite").parquet(f"{BUCKET}/parquet/transactions")
customers.write.mode("overwrite").parquet(f"{BUCKET}/parquet/customers")

print("\n=== PARQUET VALIDATION ===")
print("Parquet transactions count:",
      spark.read.parquet(f"{BUCKET}/parquet/transactions").count())

spark.stop()
