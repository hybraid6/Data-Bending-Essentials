
# Import necessary libraries
import streamlit as st
import tensorflow as tf
from tensorflow.keras.models import load_model
import numpy as np
from PIL import Image

# Set the title of the app
st.title("PCOS Detection Using Ultrasound Images")

# Add a description
st.write("""
This app uses a Convolutional Neural Network (CNN) to classify ultrasound images of ovaries as **PCOS-infected** or **healthy**.
Upload an ultrasound image, and the app will predict whether the ovary is affected by PCOS.
""")

# Load the pre-trained model
@st.cache_resource  # Cache the model to avoid reloading on every interaction
def load_pcos_model():
    model = load_model(r"C:\Users\pc\Desktop\B-older\Data and Stuff\GMC\ML GMC\Dami\pcos_detection_model.h5")  # Load the saved model
    return model

model = load_pcos_model()

# Function to preprocess the image
def preprocess_image(image):
    # Resize the image to match the model's input size (224x224)
    image = image.resize((224, 224))
    # Convert the image to grayscale (1 channel)
    image = image.convert("L")  # "L" mode converts the image to grayscale
    # Convert the image to a numpy array
    image_array = np.array(image)
    # Normalize the image (scale pixel values to [0, 1])
    image_array = image_array / 255.0
    # Add a batch dimension (model expects input shape (batch_size, 224, 224, 3))
    image_array = np.expand_dims(image_array, axis=0)
    return image_array

# Function to make predictions
def predict(image):
    # Preprocess the image
    processed_image = preprocess_image(image)
    # Make a prediction using the model
    prediction = model.predict(processed_image)
    # Get the prediction probability
    probability = prediction[0][0]
    # Convert the prediction to a class label
    if prediction[0] > 0.5:
        label =  "Healthy"
    else:
        label =  "PCOS-infected"
    # Return both the label and probability
    return label, probability

# File uploader for the user to upload an image
uploaded_file = st.file_uploader("Upload an ultrasound image", type=["jpg", "jpeg", "png"])

# If an image is uploaded, display it and make a prediction
if uploaded_file is not None:
    # Open the uploaded image
    image = Image.open(uploaded_file)
    # Display the image
    st.image(image, caption="Uploaded Image", use_column_width=True)
    # Make a prediction
    st.write("Classifying...")
    label, probability = predict(image)
    # Display the result with color coding
    if label == "Healthy":
        st.success(f"Prediction: **{label}** (Confidence: {probability:.2f})")
    else:
        st.error(f"Prediction: **{label}** (Confidence: {1 - probability:.2f})")
