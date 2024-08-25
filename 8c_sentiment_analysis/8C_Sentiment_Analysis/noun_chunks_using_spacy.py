#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov  2 15:59:19 2022

@author: dan
"""

# You can read more about getting noun chunks out of SpaCy here :
# https://spacy.io/usage/linguistic-features

# import spacy and the downloaded en_core_web_sm pre-trained model
import spacy
import en_core_web_sm

# Load the pre-trained model as a language model into a variable called nlp
nlp = en_core_web_sm.load()

# Store the text to which we want to apply the SpaCy model
my_paragraph = ("I tried to get through using the supplied telephone number "+
                "first, but nobody answered after 10 minutes so I gave up.  "+
                "I then decided to go the surgery in person, but I was "+
                "waiting for ages here too.  The receptionist I eventually "+
                "spoke to was very rude.  When I finally saw a nurse, she "+
                "was incredibly helpful, and put my mind at ease.  I thought "+
                "the coffee from their coffee machine was excellent too – "+
                "makes a change!")

# Apply the pre-trained model to generate a Doc object called article that
# will store SpaCy's predictions
article = nlp(my_paragraph)

# Loop through the predicted noun chunks, printing them out
for chunk in article.noun_chunks:
    print (chunk.text)

