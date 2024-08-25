# This tutorial has been adapted from TensorFlow's own Sentiment Analysis
# tutorial.
# See https://www.tensorflow.org/tutorials/keras/text_classification
8
# To run this code, you should use the supplied nlp_sa virtual environment.

# You also need to download the Large Movie Review Dataset v1.0 here :
# https://ai.stanford.edu/%7Eamaas/data/sentiment/

# Import tensorflow and elements of keras (the API to access tensorflow) that
# we need
import tensorflow as tf

from tensorflow.keras import layers
from tensorflow.keras import losses
from tensorflow.keras import preprocessing
from tensorflow.keras.layers import TextVectorization

from tensorflow.keras.callbacks import EarlyStopping



import tensorflow as tf
print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
print("TensorFlow version:", tf.__version__)



    

# When we push our data through the neural network, we don't want to push
# everything through at once, as it leads to over-fitting (where the NN gets
# really good at predicting the training examples, but really bad at
# generalising to anything else).  A good initial batch size is 32.
batch_size = 32

# We use a random number seed so we get the same results each time, 
# for testing purposes (the random number generators you typically use on a 
# computer are not truly random but pseudo-random.  
# Using a seed allows us to fix it so the same 'random' numbers come out each 
# time.  This is useful when testing code or we're learning how to do 
# something.  It's also essential when we're using a validation split and
# shuffling the data, as we are here, to ensure there is no overlap between
# the training and validation sets)
seed = 42

# To run this program, you need to have the aclImdb folder in the same
# directory.  This contains the Large Movie Review Dataset that contains
# 50,000 reviews from IMDB, which are split into 25,000 training examples and
# 25,000 test examples.  The data is split into sub-folders 'test' and 'train'
# and within each of these are sub-folders 'pos' and 'neg' containing
# individual text files for each review, with the 'pos' folder containing
# positive reviews, and the 'neg' folder containing negative ones.  We use
# Keras' text_dataset_from_directory method which allows us to easily load in
# different classes of examples (e.g. "positive" and "negative") as long as
# we have sub-folders for each classification, and individual text files for
# each example within these sub-folders.
# It's best to split our data into three sets - training, validation
# and test.  The training set is the data used to fit the model, the validation
# set is used during training to fine tune the model, and the testing set is 
# new data not seen during training but which has the "answers" like the 
# training and validation sets, so the trained model can see how well it 
# generalises to new data. The IMDB set is split only into training and test 
# sets.  So let's first create a training set from 80% of the training data 
# (so we can save back 20% as a validation set).  We'll split it into batches
# (the size of which we've defined above), and provide the random seed we
# specified above.
raw_train_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb_v1/aclImdb/train',
    batch_size=batch_size,
    validation_split=0.2,
    subset='training',
    seed=seed)

# We can print the class names that have been assigned to each label.  You'll
# see that label 0 has been allocated to neg (the neg folder, containing
# negative examples) and label 1 to pos (the pos folder, containing positive
# examples).
print (f"Label 0 corresponds to {raw_train_ds.class_names[0]}")
print (f"Label 1 corresponds to {raw_train_ds.class_names[1]}")

# Now let's setup our validation set.  Remember, this is the 20% of the
# training set we carved off above.  Because we're using a random seed, we won't
# accidentally take any that we used for the training set.
raw_val_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb_v1/aclImdb/train',
    batch_size=batch_size,
    validation_split=0.2,
    subset='validation',
    seed=seed)

# Now let's setup our test set.  We'll just use the test set as-is in the data
# (we don't need to split this up like we did with the training data)
raw_test_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb_v1/aclImdb/test',
    batch_size=batch_size)

# Next we'll set up a TextVectorization layer ready for when we build our
# neural network.  Vectorization here means converting text into numbers
# as neural networks (and computers generally) have to deal fundamentally with
# numbers, not text.  In our TextVectorization layer, we'll do this, and we'll
# also ask for the text to be all made lowercase and with punctuation stripped
# out before it's vectorized.  We store in max_features the maximum number of 
# tokens (words) that we want (10,000 will limit us to the 10,000 most common.  
# We don't want to include lots of words that are rarely used, as they're not 
# going to help us learn sentiment as there are so few examples, and it'll slow 
# down our learning).  We store in sequence_length the maximum length of review 
# we want to pass through the neural network (250 words (tokens) here).  
# Everything passed through the neural network must be the same length, so 
# anything longer than 250 words is truncated (so words beyond that are chopped)
# and any reviews shorter than 250 words are padded out to the required length 
# with a special padding value that the neural network ignores for training.  
# output_mode specifies how our text is transformed into numbers - 'int' turns
# each token into an integer.
max_features = 10000
sequence_length = 250

vectorize_layer = TextVectorization(
    standardize='lower_and_strip_punctuation',
    max_tokens=max_features,
    output_mode='int',
    output_sequence_length=sequence_length)

# Here's where we start the process to map our text into numbers (integers in
# our case, as we specified above when setting up the vectorize_layer).  We
# first extract just the review text (ie not the labels as well) to make a 
# text-only dataset.  We do this by defining and using a 'lambda' function.  
# These are just mini-functions in Python that are anonymous (they don't have
# a name) and are just defined and executed immediately (think of them as
# mini quick disposable functions).  Here our function takes 2 inputs (x and 
# y - x being the review text, and y being the labels) and returns just x.
# Once we've got just the text stored in train_text, we then call the adapt
# method on the preprocessing vectorize_layer we setup above - this creates the
# integers we need from the indices of the strings in the text - our vocabulary.
# Once this is done, each integer will relate to a string of text in our reviews
# (within the top 10,000 words)

'''The lambda construction train_text = raw_train_ds.map(lambda x, y:x) is used to extract just the review text from the training dataset, excluding the labels. Let's break it down:

raw_train_ds is the raw training dataset that contains both the review texts and their corresponding labels.
The map() function is applied to this dataset. It allows you to apply a given function to each element in the dataset.
lambda x, y: x is an anonymous function (lambda function) that takes two inputs:

x: represents the review text
y: represents the label


This lambda function simply returns x, which is the review text, effectively ignoring y (the label).
By applying this lambda function to each element in the dataset using map(), you create a new dataset (train_text) that contains only the review texts without their labels.

The purpose of this operation is to prepare the text data for the vectorize_layer.adapt() method, which needs only the raw text to create the vocabulary for vectorization. This step is crucial for setting up the text preprocessing pipeline, allowing the model to convert text into numerical data that it can process.
In essence, this line of code filters out the labels and keeps only the text content of the reviews, which is then used to adapt the vectorization layer to the specific vocabulary of the dataset.
'''


'''
There are several advantages to using the map function with a lambda over simply selecting one column:

Flexibility with complex datasets:

This approach works well with TensorFlow datasets, which may have more complex structures than simple columns.
It can handle nested data structures or datasets where the exact format isn't known in advance.


Maintaining dataset structure:

The map function preserves the dataset's structure and batching, which is important for TensorFlow's efficient data pipeline.
Simply selecting a column might break the dataset's internal organization.


Transformation capabilities:

While this example only returns 'x', you could easily modify the lambda to perform more complex transformations on the fly.
For instance, you could do lambda x, y: (preprocess(x), y) to apply a preprocessing function to the text while keeping the labels.


Consistency with TensorFlow/Keras API:

This method aligns well with TensorFlow's functional API, making the code more idiomatic and easier for TensorFlow/Keras users to understand.


Performance:

Map operations in TensorFlow can be optimized and potentially parallelized, which might offer performance benefits over simple indexing.


Lazy evaluation:

TensorFlow's map operations are often lazily evaluated, meaning the transformation is only applied when the data is actually used, which can be more memory-efficient.


Compatibility:

This method works consistently across different types of TensorFlow datasets, whether they're loaded from files, generated in memory, or created through other means.



While for simple cases, selecting a column might seem more straightforward, using map with a lambda offers more power, flexibility, and consistency with TensorFlow's ecosystem, especially when dealing with more complex datasets or when you might need to extend the functionality later.
'''

train_text = raw_train_ds.map(lambda x, y:x)
vectorize_layer.adapt(train_text)

# Let's create a function that applies the vectorize_layer.
# expand_dims reshapes the tensor so it can be applied to the vectorize_layer.
# Don't worry about the details of this for the moment.
def vectorize_text(text, label):
    text = tf.expand_dims(text, -1)
    return vectorize_layer(text), label

# Now we've adapted the preprocessing layer (vectorize_layer) to deal with
# integer representations of our text strings, we'll now apply the layer
# to the training, validation and test data sets we created earlier, and
# store them in new variables (so we can still access the raw unprocessed data
# if needed).  This makes sure that all the datasets are prepared in the 
# format needed to be used in the neural network.  We'll use the 
# vectorize_text function we defined above to do this for us.
train_ds = raw_train_ds.map(vectorize_text)
val_ds = raw_val_ds.map(vectorize_text)
test_ds = raw_test_ds.map(vectorize_text)

# Now let's build the Neural Network - the model.  
# We build the Neural Network by stacking 'layers' of neurons and their
# connections.  We need to consider :
# 1. how to represent the text
# 2. how many layers to use in the model
# 3. how many hidden units for each layer (hidden layers are those in the
# middle that aren't input and output layers; they're doing all the magic!)
# One way to represent text is to convert our reviews into "embedding vectors"
# using an Embedding Layer.  This essentially turns discrete data (e.g. words)
# into continuous data (a bit like distributions).

# We assemble the model by building it up layer by layer.
# The first layer is an embedding layer.  An embedding layer basically
# transforms discrete or categorical data into continuous data.  This is useful
# for text analysis, because we have a lot of features, and we can map them
# continuously rather than discretely, and also optionally benefit from
# including semantic information (so that, for example, words with similar
# meanings are located closer together).
# Here, we use an untrained embedding layer that will
# learn as the model trains.  However, we can also use a pre-trained
# embedding layer such as "https://tfhub.dev/google/nnlm-en-dim50/2" which
# has been trained on common words.  The advantage of doing that is we can
# use "transfer learning" where, rather than learn from scratch, we get all the
# training for common stuff from a pre-trained example, and then just build
# up from there, so we just learn stuff that's more specific to our problem.
# We use max_features + 1 just to be sure we've got enough room for 10,000 words
# + the padding token (0).
# 
# Next we have a dropout layer, which randomly sets a % of input units to 0
# at each step during training.  We do this to prevent over-fitting, where
# the model essentially learns how to predict the training data brilliantly,
# but is poor at predicting anything else, because it's picked up too much
# that is specific to the training data.  Here the dropout layer drops 20% of
# input units at each training step.
# 
# Next we have a GlobalAveragePooling1D layer which, in basic terms, squashes
# down the tensor by removing dimensions (it does this by taking pooled
# averages, to reduce the amount of data represented).  They are increasingly
# used as a means of preventing overfitting (less data = less potential to
# overfit).
# 
# Next we have another dropout layer, identical to the second layer.
# 
# Finally, we have a densely connected layer (all nodes from the previous layer
# connect into it) as our output layer, which has a single output node.
# 
# We specify an embedding dimension of 16 for the network, which means that
# all of the layers (other than the final layer) will have 16 hidden units
# (neurons / nodes).
embedding_dim = 64

model = tf.keras.Sequential([
    layers.Embedding(max_features+1, embedding_dim),
    layers.Dropout(0.25),
    layers.GlobalAveragePooling1D(),
    layers.Dropout(0.25),
    layers.Dense(1)])

# Now let's compile the model.  We need to specify an optimizer, a loss
# function, and the metrics to assess performance.
# An Optimizer is an algorithm that changes the weights of the Neural Network
# to reduce losses over time. Adam is one of the most commonly used Optimizers.
# A loss function calculates the difference between the model's prediction
# and the correct answer.  Here we use a Binary Crossentropy loss function
# because we're dealing with a binary classification problem (two 
# classifications - positive or negative), and Binary Crossentropy is good
# at dealing with probabilities, as it measures the distance between
# probability distributions - here, that's the distance between the "correct"
# classification and the prediction.  from_logits=True just means normalise
# the outputs so they're between 0 and 1 (rather than +/- infinity).
# Metrics determine how we measure success.  Here, we use Accuracy as our
# metric, which determines the number of predictions the machine got correct
# out of the total number of predictions.
model.compile(optimizer='adam',
              loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),
              metrics=['accuracy'])

# Here, we set up an EarlyStopping callback and ask it to monitor the
# validation accuracy.  We specify a min_delta, which is the minimum amount
# accuracy must improve, and if it doesn't improve by at least this amount
# then the training is terminated.  Patience represents the number of epochs
# to wait until training is stopped, so a patience value of 1 would terminate
# the training after 1 epoch of no improvement.
# By default, we won't use this callback (see below) as we usually want to see
# if we are overfitting first.
earlystop_callback = EarlyStopping(
    monitor='val_accuracy',
    min_delta=0.001,
    patience=1)

# Now we need to train the model (a process known as "fitting").  We give
# it the training data we separated out earlier, and we specify that we want 
# 20 'epochs' (an epoch is over once all batches of training data have been 
# pushed through the network).  We also specify the 'validation data' that we 
# want the to use to check how well the model is doing and adjust 
# (hopefully to improve). Remember, we carved off 20% of the training
# data to use as validation data back at the start.  So we'll use that here.
# If we want to use the earlystopping callback we created above, we need to
# uncomment that line of code.  But initially, let's not use it - we need to
# see if we are overfitting first.
# Verbose=1 simply means that the model will report its progress as
# it learns with an animated progress bar (0 will show you nothing, whilst 2
# will show you just the epoch number without the progress bar)
epochs = 20

history = model.fit(
    train_ds,
    validation_data=val_ds,
    epochs=epochs,
    callbacks=[earlystop_callback],  
    verbose=1)

# Now let's evaluate the model on the test dataset (which it hasn't seen yet).
# This will give us an indication of how well it generalises.  I'll round
# the results to 2 dp when printing for the user
loss, accuracy = model.evaluate(test_ds)
print ("EVALUATION ON TEST DATASET")
print (f"Loss : {loss:.2f}")
print (f"Accuracy : {accuracy:.2f}")

# If we want the model to be able to process new raw strings of text (rather
# than having to vectorize them separately first to convert
# them to numbers), we can export a version of our model by creating a new
# model using the weights we've just trained, and which includes the text
# vectorization layer.  We'll add a sigmoid activation function as an
# additional layer at the end.  An activiation function transforms the summed
# weighted input into a node into the output (or "activation") of that node.
# The sigmoid activation function will return a floating point number
# between 0 and 1 which will represent the confidence that the
# output is 0 (negative review) or 1 (positive review).  The closer it is to
# these values, the higher the confidence.  We can then apply a threshold to
# determine when we declare it one or the other.
# So, the new model is a vectorization layer, followed by all the layers of
# the trained model (complete with the weights following training), and a
# sigmoid output layer.
export_model = tf.keras.Sequential([
    vectorize_layer,
    model,
    layers.Activation('sigmoid')])

# Now let's compile our new model.  We use from_logits=False here because
# the sigmoid activation function will normalise the outputs to between 0 and
# 1 anyway
export_model.compile(
    optimizer='adam',
    loss=losses.BinaryCrossentropy(from_logits=False),
    metrics=['accuracy'])

# Here's where we save our exported model so we can open it again elsewhere
# without having to retrain it.  Note - you may want to save different trained
# models - in which case, change the filename each time.
export_model.save('trained_sa_model.keras')

# Portions of this code are taken from 
# https://www.tensorflow.org/tutorials/keras/text_classification
# MIT License
#
# Copyright (c) 2017 François Chollet
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

