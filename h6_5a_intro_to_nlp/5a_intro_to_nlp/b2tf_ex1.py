'''
You’ll now work in your groups for 40 minutes (+ 5 minute break).  You have been provided with three reviews for Back to the Future in three separate .txt files (review_1.txt, review_2.txt and review_3.txt).  These have been randomly plucked from the reviews we used earlier for the word cloud.  Your task is as follows :
Read in these reviews from their files as three documents.  Tip : you can use f-strings in a filename to allow you to specify part of the name of a file via a variable value.  Perhaps the counter in a list, for example…
Vectorize the three reviews using Bag of Words.  Store the results of the vectorization in a Pandas DataFrame.
Calculate and print the cosine similarity of the three combinations of pairs of reviews.  A couple tips :
You should check out https://www.geeksforgeeks.org/how-to-calculate-cosine-similarity-in-python/ for a neat little way you can apply the cosine similarity equation in Python using NumPy
You can easily create a NumPy array from a Pandas DataFrame df using


Once you’ve done that, try playing around with it.  How does including / excluding stopwords affect similarity?  How about including unigrams and trigrams (either exclusively or additionally)?  Can you find other reviews (or even other pieces of text entirely) that are much more similar to each other?

When we come back, we’ll find out if anyone managed to find anything interesting.  There may even be some adhoc PSG Points up for grabs for anything particularly interesting!

'''


# Import packages
from sklearn.feature_extraction.text import CountVectorizer
import pandas as pd
import string

from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity






# A list of our documents

raw_documents = []

for i in range(1, 4):
    with open(f"review_{i}.txt", "r") as f:
        raw_documents.append(f.read())



from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import ENGLISH_STOP_WORDS

# Define your additional stop words
additional_stop_words = {'Back', 'To', 'Future'}

# Combine the default stop words with your additional stop words
custom_stop_words = list(ENGLISH_STOP_WORDS.union(additional_stop_words))

# Create the CountVectorizer with the custom stop words
vectorizer = CountVectorizer(stop_words=custom_stop_words, ngram_range=(1, 2))

# Generate a bag of words using the vectorizer
bag_of_words = vectorizer.fit_transform(raw_documents)

X = vectorizer.fit_transform(raw_documents)

cosine_sim = cosine_similarity(X)

# Create a Pandas DataFrame to more easily visualise the Bag of Words
# Grab the column names (words in our vocabulary).  Rows will represent the
# counts for each document.  We can view this in the console after running the
# code by simply typing bow_df
column_names = vectorizer.get_feature_names_out()
bow_df = pd.DataFrame(bag_of_words.toarray(), columns=column_names)

# Print each document along with its bag of words vector representation
for i in range(0, len(raw_documents)):
    print (raw_documents[i])
    print ("becomes")
    print (bow_df.iloc[i].values)
    print ()

print(cosine_sim)


cosine_sim_df = pd.DataFrame(cosine_sim, index=raw_documents, columns=raw_documents)
print(cosine_sim_df)