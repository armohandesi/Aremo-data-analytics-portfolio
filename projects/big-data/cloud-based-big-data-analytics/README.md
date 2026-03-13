# ☁️ Cloud-Based Big Data Analytics for Retail Transactions

## 📌 Project Overview

This project implements a **cloud-based big data analytics pipeline** to process large-scale retail transaction data using distributed computing frameworks.

The system was deployed on **Google Cloud Dataproc** and combines **Apache Spark** and **Hadoop MapReduce** to perform large-scale data processing and customer behavior analysis.

The goal of the project is to demonstrate how modern **big data technologies** can be used to analyze large retail datasets and extract valuable business insights.

---

## ⚙️ Technologies Used

* Apache Spark
* Hadoop MapReduce (Streaming)
* PySpark
* Google Cloud Platform (Dataproc)
* Python
* Distributed Data Processing
* Machine Learning (KMeans Clustering)

---

## 📊 Dataset

The dataset contains retail transaction records including:

* Customer ID
* Product ID
* Transaction Value
* Transaction Timestamp

The dataset includes:

* **1,048,575 transactions**
* **7,000 customers**

This scale makes the dataset suitable for **distributed analytics frameworks**.

---

## 🏗️ System Architecture

The big data architecture used in this project includes:

1️⃣ **Google Cloud Storage**
Used as the data lake for storing raw retail transaction data.

2️⃣ **Google Cloud Dataproc Cluster**
Used to run distributed computing frameworks.

3️⃣ **Apache Spark**
Used for scalable big data analytics and transformations.

4️⃣ **Hadoop MapReduce**
Implemented using Python streaming to demonstrate distributed batch processing.

---

## 🔄 Data Processing Pipeline

The distributed processing workflow includes:

1. Data ingestion from cloud storage
2. Data validation and schema checks
3. Data transformation and aggregation
4. Feature engineering for customer analysis
5. Machine learning clustering with Spark MLlib

---

## 🤖 Machine Learning Model

Customer segmentation was implemented using:

**Algorithm:** KMeans Clustering

Customer-level features used:

* Transaction frequency
* Total spending
* Average transaction value
* Product diversity

Model performance was evaluated using **Silhouette Score**.

---

## 📈 Results

The distributed analytics pipeline processed **over 1 million transactions** and identified **three customer segments** based on purchasing behavior.

Key results:

* Transactions processed: **1,048,575**
* Customers analyzed: **7,000**
* Optimal clusters: **3**
* Silhouette Score: **0.535**

The results demonstrate the effectiveness of **scalable big data systems for customer analytics**.

---

## 📂 Project Structure

```
cloud-based-big-data-analytics
│
├── spark_processing.py
├── mapper.py
├── reducer.py
│
├── spark_output.txt
├── mapreduce_logs.txt
└── ml_kmeans_output.txt
```

---

## 🎯 Key Learnings

* Building distributed data pipelines in **Google Cloud**
* Comparing **Apache Spark vs Hadoop MapReduce**
* Processing large-scale retail datasets
* Implementing machine learning pipelines on big data platforms

---

## 👤 Author

**Aremo Mohandessi**
Data Analytics Portfolio Project

