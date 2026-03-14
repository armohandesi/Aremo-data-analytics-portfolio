# 🌿 Plant Disease Classification using Deep Learning

## 📌 Project Overview

This project explores **deep learning-based image classification** for automated plant disease detection in smart agriculture.

Early detection of plant diseases is essential for reducing crop losses and improving agricultural productivity. Traditional inspection methods rely on manual observation and expert knowledge, which are time-consuming and often inconsistent.

In this project, a computer vision system was developed to classify plant leaf diseases using the **PlantVillage dataset**. Two architectures were implemented and compared:

* A **custom Convolutional Neural Network (CNN)** baseline
* A **ResNet50 transfer learning model**

The goal was to evaluate how transfer learning improves classification performance in plant disease detection tasks.

---

## 📊 Dataset

The project uses the **PlantVillage dataset**, a widely used benchmark dataset for plant disease detection.

Dataset characteristics:

* ~50,000 leaf images
* 15 disease and healthy classes
* Crops included:

  * Tomato
  * Potato
  * Bell Pepper

Each image represents either a **healthy leaf** or a **specific plant disease condition**.

Note:
The dataset images were collected under **controlled laboratory conditions**, which introduces challenges when applying models to real-world field images.

---

## 🧠 Models Implemented

### 1️⃣ Custom CNN (Baseline)

A simple convolutional neural network was implemented with:

* Two convolutional layers
* Two fully connected layers
* Cross-entropy loss
* Adam optimizer

This model served as a **baseline architecture** to evaluate how well a simple network can learn disease-related visual features.

**Validation Accuracy:**
≈ **85.75%**

---

### 2️⃣ ResNet50 Transfer Learning

A **ResNet50 model pre-trained on ImageNet** was fine-tuned for plant disease classification.

Key aspects:

* Transfer learning from ImageNet
* Final fully connected layer replaced with a 15-class classifier
* Training performed using PyTorch

**Performance:**

* Validation Accuracy: **99.25%**
* Test Accuracy: **99.18%**

The results show a significant improvement over the baseline CNN.

---

## 📈 Evaluation

Model evaluation included:

* Accuracy
* Precision
* Recall
* F1-score
* Confusion Matrix

The confusion matrix showed strong classification performance across most classes, with minor confusion between visually similar diseases.

Additional testing was performed on **external images outside the dataset** to evaluate generalization performance.

Results indicated that:

* The model performs very well on controlled images
* Performance decreases on real-world images with different backgrounds or lighting

This highlights a common limitation when training on laboratory datasets.

---

## ⚙️ Technologies Used

* Python
* PyTorch
* Torchvision
* NumPy
* Matplotlib
* Google Colab

---

## 📂 Project Structure

```text
plant-disease-classification
│
├── notebooks
│   └── plant-disease-classification.ipynb
│
├── images
│   └── example_predictions
│
├── models
│   └── best_resnet50_model.pth
│
├── requirements.txt
│
└── README.md
```

---

## 🚀 Future Improvements

Possible directions to extend this project include:

* Training with **field images** instead of laboratory datasets
* Applying **domain adaptation techniques** to improve real-world robustness
* Experimenting with lightweight architectures such as:

  * MobileNet
  * EfficientNet
* Deploying the model on **mobile or edge devices** for smart agriculture applications

---

## 👤 Author

**Aremo Mohandessi**
Data Analytics & Computer Vision Portfolio Project

