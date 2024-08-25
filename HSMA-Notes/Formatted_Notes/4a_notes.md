# Module 4: Introduction to AI

Using AI to 
 - simulate human decision making
 - exract information from written texts

## Machine Learning

Algorithms that enable machines to learn by experience and or data.
Aim is to make a prediction (or classification) based on data.
Seen as Decision Support Tools (ha ha)

Used to:
- automate tasks that are expensive (time or money)
- classify data and produce insight
- identify patterns, maybe otherwise hidden patterns

### Caveats

- they can and do get things wrong
- there may be ethical considerations
- the 42 problem: the answer is 42, but what is the question?
    - the answer may be that we cannot train a machine to usefully answer!
## With that said...

### Features

Features are the input data that the model uses to make a prediction.

### Labels

Labels are the output data that the model is trying to predict.

## Three main types of machine learning

- Supervised learning
- Unsupervised learning
- Reinforcement learning

### Supervised learning

We show lots of inputs and their outputs (a labelled dataset) and the model learns the relationship between the two.

Predict classification (a or b) or regression ($ \beta $ ).

### Unsupervised learning

We show lots of inputs but no outputs. The model tries to find patterns in the data. 

### Reinforcement learning

The model learns by trial and error. It gets a reward for making the right decision and a penalty for making the wrong decision.


#### Classification versus regression

Classification is where the output is a category (a or b).
Regression is where the output is a number. Often the probability of being in a category, or of something being true.

##### Classification binary versus multi-class, multi-label

Binary classification is where there are two categories.

Multi-class classification is where there are more than two categories.

Multi-label classification is where there are multiple categories that can be true at the same time.

# Breakout: machine learning ideas

Risk stratification of surgery - we have a database of patients and their outcomes. Can we predict the outcome of a new patient?

Extracting information from old letters?

Case finding - is this person going to need admision in the next day, week, month, year?

What group does this person belong to in terms of resources needed?

Ambulance need prediction - where will the next call be?

Risk of diabetic foot amputation based on primary care data?

EHR fall risk prediction? Based on age, frailty scores, BP, medications, previous falls. Deprivation, stairs. Tweaking EPIC definitions. 

Prison service - predicting who will reoffend? Based on age, previous offences, family history, education, employment, drug use, mental health, housing, social support, etc.

Cardiovascular disease - multi-morbidity and risk of developing other conditions

Waiting lists - can you predict on factors including length of wait, what is the risk of needing emergency admission or ending up on medications that cause issue in the long term. 

Waiting lists - how does it impact employment etc - what is the impact?

Looking at price clustering in suppliers. 

Social care: number of assessments based on seasonality and other factors.

Facial recognition in prisons.

## Training and Testing sets

Supervised learning: the training set is used to train the model. The testing set is used to test the model. We do not train on the test set!

Data is usually split into training and test set - the train/test split. 80:20 is common.

Usually most of the data is carved off into the training set, and the rest is the test set.

There is also a train/validation/test split. The validation set is used to tune the model. The validation set is used as part of the training mode. 

### Training set:

Used to teach the model patterns and relationships in the data
The model learns from these examples to make predictions
Typically the largest portion of your data

### Validation set:

Used to tune hyperparameters and evaluate model performance during training
Helps prevent overfitting by providing an unbiased evaluation
Usually smaller than the training set, but larger than the test set

The main purpose is to ensure the model generalizes well to new, unseen data. By using separate sets, you can assess if the model is learning effectively or just memorizing the training data.

### Overfitting

Overfitting is when the model learns the training data too well. It learns the noise in the data, not the signal.

We often overfit when we have too many features or too complex a model. We tend to overfit at first, then we simplify the model. Overfitting is a problem though because it is tempting to keep adding features to improve the model.

### Underfitting

The model is too simple and we haven't tried hard enough to learn the data. Model is poor everywhere. 

## Machine learning metrics

### Accuracy

accuracy = total correct/ number of predictions

### Precision

precision = true positives / (true positives + false positives)

PPV = positive predictive value

### Recall

recall = true positives / (true positives + false negatives)

Sensitivity = recall

Important not to be misled by accuracy - it depends so much on the 
underlying rates.

Frequently the outcome of interest is less common, so sometimes it can help to have synthetic data in a training set to over-represent those. 