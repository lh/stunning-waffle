import tensorflow as tf
tf.config.list_physical_devices('GPU')

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Mac specific setup
import tensorflow as tf
# tf.config.list_physical_devices('GPU') uncomment to check a GPU is found
from tensorflow.keras import mixed_precision
mixed_precision.set_global_policy('mixed_float16')


# sklearn for pre-processing
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler

# sklearn for model evaluation
from sklearn.model_selection import learning_curve
from sklearn.metrics import mutual_info_score

# TensorFlow sequential model
from tensorflow import keras
from tensorflow.keras import backend as K
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import BatchNormalization
from tensorflow.keras.layers import Dense
from tensorflow.keras.layers import Dropout
from tensorflow.keras.optimizers import Adam

import json # For saving model outcomes
# Download data 
# (not required if running locally and have previously downloaded data)

download_required = True

if download_required:
    
    # Download processed data:
    address = 'https://raw.githubusercontent.com/MichaelAllen1966/' + \
                '2004_titanic/master/jupyter_notebooks/data/hsma_stroke.csv'        
    data = pd.read_csv(address)

    # Create a data subfolder if one does not already exist
    import os
    data_directory ='./data/'
    if not os.path.exists(data_directory):
        os.makedirs(data_directory)

    # Save data to data subfolder
    data.to_csv(data_directory + 'hsma_stroke.csv', index=False)

def scale_data(X_train, X_test):
    """Scale data 0-1 based on min and max in training set"""
    
    # Initialise a new scaling object for normalising input data
    sc = MinMaxScaler()

    # Apply the scaler to the training and test sets
    train_sc = sc.fit_transform(X_train)
    test_sc = sc.fit_transform(X_test)
    
    return train_sc, test_sc

def scale_data(X_train, X_test):
    """Scale data 0-1 based on min and max in training set"""
    
    # Initialise a new scaling object for normalising input data
    sc = MinMaxScaler()

    # Apply the scaler to the training and test sets
    train_sc = sc.fit_transform(X_train)
    test_sc = sc.fit_transform(X_test)
    
    return train_sc, test_sc



def make_net(number_features, 
            hidden_layers=3, 
            hidden_layer_neurones=128, 
            dropout=0.0, 
            learning_rate=0.003):
    
    """Make TensorFlow neural net"""
    
    # Clear Tensorflow 
    K.clear_session()
    
    # Set up neural net
    net = Sequential()
    
    # Add hidden hidden_layers using a loop
    for i in range(hidden_layers):
        # Add fully connected layer with ReLu activation
        net.add(Dense(
            hidden_layer_neurones, 
            input_dim=number_features,
            activation='relu'))
        # Add droput layer
        net.add(Dropout(dropout))
    
    # Add final sigmoid activation output
    net.add(Dense(1, activation='sigmoid'))    
    
    # Compiling model
    opt = Adam(learning_rate=learning_rate)
    
    net.compile(loss='binary_crossentropy', 
                optimizer=opt, 
                metrics=['accuracy'])
    
    return net

def calculate_accuracy(model, X_train_sc, X_test_sc, y_train, y_test):
    """Calculate and print accuracy of training and test data fits"""    
    
    ### Get accuracy of fit to training data
    probability = model.predict(X_train_sc)
    y_pred_train = probability >= 0.5
    y_pred_train = y_pred_train.flatten()
    accuracy_train = np.mean(y_pred_train == y_train)
    
    ### Get accuracy of fit to test data
    probability = model.predict(X_test_sc)
    y_pred_test = probability >= 0.5
    y_pred_test = y_pred_test.flatten()
    accuracy_test = np.mean(y_pred_test == y_test)
  
    
    # Show accuracy
    print (f'Training accuracy {accuracy_train:0.3f}')
    print (f'Test accuracy {accuracy_test:0.3f}')
    return accuracy_test

    
def plot_training(history_dict, title = 'Training and validation accuracy'):
    acc_values = history_dict['accuracy']
    val_acc_values = history_dict['val_accuracy']
    epochs = range(1, len(acc_values) + 1)

    fig, ax = plt.subplots()

    ax.set_xlabel('Time')
    ax.set_ylabel('Accuracy')

    ax.plot(epochs, acc_values, color='blue', label='Training acc')
    ax.plot(epochs, val_acc_values, color='red', label='Test accuracy')
    ax.set_title(title)
    
    ax.legend()
    print("saving figure")
    fig.savefig('/Users/rose/HSMA/h6_4f_neural_networks/4f_neural_networks/training_plot.png')



data = data.astype(float)
X = data.drop('Clotbuster given',axis=1) # X = all 'data' except the 'survived' column
y = data['Clotbuster given'] # y = 'survived' column from 'data'
# Convert to NumPy as required for k-fold splits
X_np = X.values
y_np = y.values

# Split data
X_train, X_test, y_train, y_test = train_test_split(
    X_np, y_np, test_size = 0.25, random_state=42)

# Scale X data
X_train_sc, X_test_sc = scale_data(X_train, X_test)


results_file_path = 'experiment_results.jsonl'  # JSON Lines format

# Define save checkpoint callback (only save if new best validation results)
checkpoint_cb = keras.callbacks.ModelCheckpoint(
    'model_checkpoint.keras', save_best_only=True)

# Define early stopping callback
# Stop when no validation improvement for 25 epochs
# Restore weights to best validation accuracy
early_stopping_cb = keras.callbacks.EarlyStopping(
    patience=25, restore_best_weights=True)

learning_rate=0.001
dropout=0.4
hidden_layer_neurones=128
hidden_layers=4
batch_size=30
 #   "accuracy_test": 0.8497854077253219

# Define network
number_features = X_train_sc.shape[1]
model = make_net(number_features, 
                hidden_layers=hidden_layers, 
                hidden_layer_neurones=hidden_layer_neurones, 
                dropout=dropout, 
                learning_rate=learning_rate)



print("starting training")
### Train model (and store training info in history)
history = model.fit(X_train_sc,
                    y_train,
                    epochs=25,
                    batch_size=batch_size,
                    validation_data=(X_test_sc, y_test),
                    verbose=0)

plot_training(history.history, title = "Optimised 1")

calculate_accuracy(model, X_train_sc, X_test_sc, y_train, y_test)

model.save('/Users/rose/HSMA/h6_4f_neural_networks/4f_neural_networks/clot_optimised.keras')





