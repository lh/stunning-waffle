import tensorflow as tf
from tensorflow.keras import layers
from tensorflow.keras import losses
from tensorflow.keras import preprocessing
from tensorflow.keras.layers import TextVectorization
from tensorflow.keras.callbacks import EarlyStopping
import string
import re

print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
print("TensorFlow version:", tf.__version__)

batch_size = 24
'''
batch = 32
EVALUATION ON TEST DATASET
Loss : 0.30
Accuracy : 0.88

batch = 64
EVALUATION ON TEST DATASET
Loss : 0.41
Accuracy : 0.85

batch = 16
EVALUATION ON TEST DATASET
Loss : 0.30
Accuracy : 0.87

batch = 24
EVALUATION ON TEST DATASET
Loss : 0.32
Accuracy : 0.88

'''
seed = 42

# Define stop words
stop_words = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from', 'has', 'he', 
              'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to', 'was', 'were', 
              'will', 'with']

# Custom standardization function to remove stopwords
def custom_standardization(input_data):
    lowercase = tf.strings.lower(input_data)
    stripped_html = tf.strings.regex_replace(lowercase, '<br />', ' ')
    stripped_punctuation = tf.strings.regex_replace(stripped_html,
                                    '[%s]' % re.escape(string.punctuation),
                                    ' ')
    
    # Remove stop words
    for word in stop_words:
        stripped_punctuation = tf.strings.regex_replace(stripped_punctuation, r'\b' + word + r'\b', '')
    
    # Remove extra spaces
    cleaned_text = tf.strings.regex_replace(stripped_punctuation, r'\s+', ' ')
    return tf.strings.strip(cleaned_text)

# Load datasets
raw_train_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb_v1/aclImdb/train',
    batch_size=batch_size,
    validation_split=0.2,
    subset='training',
    seed=seed)

raw_val_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb_v1/aclImdb/train',
    batch_size=batch_size,
    validation_split=0.2,
    subset='validation',
    seed=seed)

raw_test_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb_v1/aclImdb/test',
    batch_size=batch_size)

# Print class names
print(f"Label 0 corresponds to {raw_train_ds.class_names[0]}")
print(f"Label 1 corresponds to {raw_train_ds.class_names[1]}")

max_features = 10000
sequence_length = 250

# Modified TextVectorization layer to include stop word removal
vectorize_layer = TextVectorization(
    standardize=custom_standardization,
    max_tokens=max_features,
    output_mode='int',
    output_sequence_length=sequence_length)

# Adapt the layer to the training text
train_text = raw_train_ds.map(lambda x, y: x)
vectorize_layer.adapt(train_text)

# Vectorize text function
def vectorize_text(text, label):
    text = tf.expand_dims(text, -1)
    return vectorize_layer(text), label

# Apply vectorization to datasets
train_ds = raw_train_ds.map(vectorize_text)
val_ds = raw_val_ds.map(vectorize_text)
test_ds = raw_test_ds.map(vectorize_text)

# Model definition
embedding_dim = 32

model = tf.keras.Sequential([
    layers.Embedding(max_features+1, embedding_dim),
    layers.Dropout(0.3),
    layers.GlobalAveragePooling1D(),
    layers.Dropout(0.2),
    layers.Dense(1)])

# Compile model
model.compile(optimizer='adam',
              loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),
              metrics=['accuracy'])

# EarlyStopping callback

earlystop_callback = EarlyStopping(
    monitor='val_accuracy',
    min_delta=0.0005,
    patience=5,
    restore_best_weights=True
)

# Train model
epochs = 50  # Increased from 20




history = model.fit(
    train_ds,
    validation_data=val_ds,
    epochs=epochs,
    callbacks=[earlystop_callback],
    verbose=1)

# Evaluate model
loss, accuracy = model.evaluate(test_ds)
print("EVALUATION ON TEST DATASET")
print(f"Loss : {loss:.2f}")
print(f"Accuracy : {accuracy:.2f}")

# Export model
export_model = tf.keras.Sequential([
    vectorize_layer,
    model,
    layers.Activation('sigmoid')])

export_model.compile(
    optimizer='adam',
    loss=losses.BinaryCrossentropy(from_logits=False),
    metrics=['accuracy'])

# Save model
export_model.save('trained_sa_model_with_stopwords_removal.keras')

print("hello world")