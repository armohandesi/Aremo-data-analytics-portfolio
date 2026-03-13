# 🧠 Detecting Uncontrolled Anger in Social Media Using NLP

## 📌 Project Overview

This project investigates how **Natural Language Processing (NLP)** can detect **uncontrolled anger in social media comments**.

The study compares traditional machine learning models with transformer-based deep learning models to analyse emotional expressions in **Twitter and Reddit posts**.

The goal is to explore whether automated systems can identify potential signals of **mental health risks and emotional dysregulation in online discussions**.

---

## 📊 Datasets

The project uses three well-known NLP datasets:

* **GoEmotions (Reddit)** – 58k labeled comments
* **SemEval-2018 Twitter Emotion Dataset (E-c)**
* **SemEval-2018 Emotion Intensity Dataset (EI-reg)**

These datasets allow analysis of both:

* categorical emotions
* anger intensity scores

---

## 🤖 Models Compared

### Baseline Models

* Logistic Regression
* Support Vector Machine (SVM)
* TF-IDF features

### Deep Learning Model

* DistilBERT Transformer

---

## 📈 Key Findings

* Traditional models can detect **basic anger patterns**, but struggle with contextual understanding.
* **DistilBERT significantly improves performance**, increasing F1 scores on Twitter datasets.
* Cross-platform transfer remains difficult:

  * models trained on Twitter perform poorly on Reddit
  * language style differences affect model generalisation.

---

## ⚙️ Technologies Used

* Python
* Scikit-learn
* HuggingFace Transformers
* Pandas
* NLTK
* SpaCy
* Google Colab

---

## 📂 Project Structure

```
anger-detection-nlp
│
├── notebook.ipynb
├── report.pdf
└── README.md
```

---

## 🎯 Key Learning Outcomes

* NLP for mental health analytics
* Emotion detection in social media
* Comparing classical ML vs transformer models
* Cross-domain evaluation in NLP systems

---

## 👤 Author
## Aremo Mohandessi



