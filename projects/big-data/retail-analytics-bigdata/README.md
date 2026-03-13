# 🛒 Retail Analytics with Apache Spark & Hive

This project demonstrates an end-to-end big data pipeline for retail transaction analysis using Apache Spark, HiveQL, and MLlib.

## 📌 Objective
To analyze historical retail transactions and customer demographics to:
- Identify sales trends over time
- Aggregate country-level revenue
- Evaluate relationships between demographic features and spending
- Build a predictive model for transaction amounts

## 🧰 Tools & Technologies
- Apache Spark (PySpark API)
- HiveQL (executed via Spark SQL)
- Spark MLlib (Linear Regression, Random Forest)
- Jupyter Notebook (Google Colab)
- Docker (initial setup attempt)
- Python (StringIndexer, OneHotEncoder, StandardScaler)

## 📊 Dataset
Combined from:
- `store_transactions.csv` (transaction data)
- `store_customers.csv` (demographics)

Rows after merging: **102,509 records**

## 🔍 Key Insights
- Sales peaked on Jan 7 & Jan 13
- Demographic features (age, salary) had no strong correlation with spending
- England generated 44% of revenue across countries
- Predictive models performed poorly due to lack of strong features

## 🧪 ML Results
| Model              | RMSE     | R² Score |
|--------------------|----------|----------|
| Linear Regression  | 2893.22  | -0.0001  |
| Random Forest      | 2893.39  | -0.0003  |

> Models failed to generalize due to insufficient feature richness.

## 🧠 Lessons Learned
- Feature engineering is more critical than algorithm selection
- Spark MLlib enables scalable modeling workflows, even for academic tasks
- Honest evaluation of failure is essential for growth

## 🔗 Resources
- 📄 [Project Report (PDF)](../retail-analytics-bigdata/report.pdf)
- 🧪 [Colab Notebook](https://colab.research.google.com/drive/1TLaneWHdnHYQXL7GTolJ7N0ElE5sVMPv?usp=sharing)

---

Feel free to explore the notebook and report to see the full workflow in action.

