# 🧠 Brain Tumor Segmentation in MRI using U-Net

## 📌 Project Overview

This project implements a **deep learning–based medical image segmentation system** for detecting brain tumors in MRI scans.
Manual tumor segmentation performed by radiologists is time-consuming and may produce inconsistent results across different experts. Automated segmentation using deep learning can assist clinical workflows by providing faster and more consistent tumor localization.

In this project, a **U-Net convolutional neural network** was developed to perform pixel-level tumor segmentation on MRI images. The model was trained and evaluated using the **LGG MRI Segmentation Dataset from The Cancer Imaging Archive (TCIA)**.

U-Net was selected because it is one of the most widely used architectures for biomedical image segmentation. Its **encoder–decoder structure with skip connections** allows the network to preserve spatial information while learning high-level semantic features, making it particularly effective for medical imaging tasks with limited datasets.

---

## 📊 Dataset

The model was trained using the **LGG MRI Segmentation Dataset**, which contains MRI scans of patients diagnosed with **low-grade glioma (LGG)**.

Each sample in the dataset includes:

* An MRI brain image
* A corresponding **ground-truth segmentation mask** indicating tumor regions

Dataset characteristics:

* MRI images paired with expert-annotated tumor masks
* Images stored in `.tif` format
* Tumor regions labeled using `_mask` annotations

Before training, several preprocessing steps were applied to standardize the dataset and improve training stability.

---

## ⚙️ Data Preprocessing

The preprocessing pipeline included the following steps:

1. **Image resizing**
   All MRI slices were resized to **128 × 128 pixels** to reduce computational cost and ensure consistent input dimensions.

2. **Normalization**
   Pixel values were scaled to the range **[0, 1]** to improve neural network training stability.

3. **Dataset splitting**
   The dataset was divided into:

   * **80% training data**
   * **20% testing data**

This split ensures proper model evaluation while preventing data leakage between training and testing samples.

---

## 🧠 Model Architecture

The segmentation model is based on the **U-Net architecture**, a fully convolutional neural network specifically designed for biomedical image segmentation.

The network consists of two main components:

### Encoder (Contracting Path)

The encoder extracts hierarchical image features through repeated blocks of:

* Convolution layers with **ReLU activation**
* **Max-pooling** operations for downsampling

Feature channels increase progressively from **64 to 512 filters**, allowing the model to capture increasingly complex visual patterns.

### Bottleneck Layer

A **1024-filter convolutional layer** connects the encoder and decoder sections, capturing high-level semantic features before reconstruction.

### Decoder (Expanding Path)

The decoder reconstructs spatial resolution using:

* **Transposed convolution (upsampling)**
* Feature map concatenation via **skip connections**

Skip connections transfer spatial information from encoder layers to the decoder, enabling accurate boundary reconstruction during segmentation.

### Output Layer

The final layer uses:

* **1×1 convolution**
* **Sigmoid activation**

to generate a **binary segmentation mask**, representing the probability of tumor presence for each pixel.

---

## 🏋️ Model Training

The model was implemented using **TensorFlow and Keras** and trained under the following configuration:

* Optimizer: **Adam**
* Loss function: **Binary Cross-Entropy (BCE)**
* Evaluation metrics:

  * **Dice coefficient**
  * **Intersection over Union (IoU)**

Training settings:

* Epochs: **20**
* Batch size: **8**
* Validation split: **20% of training data**

Training curves showed stable convergence with decreasing loss values and no significant signs of overfitting.

---

## 📈 Evaluation Metrics

To evaluate segmentation quality, two standard metrics were used:

### Dice Coefficient

The Dice coefficient measures the overlap between predicted segmentation masks and ground-truth annotations.

Higher Dice scores indicate stronger spatial agreement between prediction and reference masks.

### Intersection over Union (IoU)

IoU measures the ratio between the **intersection and union of predicted and ground-truth tumor regions**, providing a robust evaluation of segmentation accuracy.

---

## 📊 Results

The trained model demonstrated stable segmentation performance on the test dataset.

Key results:

* **Mean IoU:** 0.7184
* **Validation Dice Score:** 0.50

Quantitative results indicate strong spatial agreement between predicted tumor masks and expert annotations.

Qualitative evaluation showed that the model was particularly effective in detecting:

* Large tumors with clear boundaries
* Tumor regions located near the center of MRI slices

However, the model occasionally struggled with:

* Very **small lesions**
* **Low-contrast tumor boundaries**
* Tumors located near image edges

These limitations are common in medical segmentation tasks with limited training data.

---

## ⚙️ Technologies Used

* Python
* TensorFlow
* Keras
* NumPy
* Matplotlib
* OpenCV

---

## 📂 Project Structure

```text
brain-tumor-segmentation-unet
│
├── notebooks
│   └── brain-tumor-segmentation-unet.ipynb
│
├── models
│   └── unet_brain_tumor_model.h5
│
├── requirements.txt
│
└── README.md
```

---

## 🚀 Future Improvements

Several directions could improve the model’s performance and generalization capability:

* Integrating **Dice loss or hybrid BCE + Dice loss functions**
* Applying **data augmentation techniques** such as rotation, flipping, and brightness variation
* Using **3D U-Net architectures** to leverage volumetric MRI information
* Incorporating **attention mechanisms** to improve detection of small or low-contrast lesions

These improvements could enhance the robustness of the segmentation model and make it more suitable for real clinical environments.

---

## 👤 Author

**Ahmadreza Mohandessi**
Computer Vision & Artificial Intelligence Portfolio Project

