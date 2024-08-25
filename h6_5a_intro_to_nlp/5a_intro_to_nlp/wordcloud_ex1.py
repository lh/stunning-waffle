'''
ou’ll now work in your groups for 40 minutes (+ 10 minute comfort break).
We'll return at 3pm.
Your task, as a group, is as follows :
1. You’ll have seen from the word cloud we generated on Back to the Future reviews that there were a few words that may not be that helpful if we know the cloud refers to movie reviews about Back to the Future.  Your first task is to adapt the code in wordcloud_example.py (take a copy first) to remove the following words from the word cloud : “movie”, “film”, “back”, “future” and “one” (a word that seems to come up a lot in these reviews).  You can approach this however you like, but try to make your solution as elegant as possible, and future-proof it to make it easy for you to change the words you remove.
2. You should then try out your new word cloud generating skills by creating a word cloud on some text of your choosing.  The text can be anything you like.  Once you’ve generated your word cloud, you should refine it much as you did above, to remove anything that you don’t think is useful.  You should also tweak the visualisation of the word cloud - try different colours, sizes, and limits on the word frequencies allowed through (via the font size proxy).
Once you’ve generated your finalised word cloud, post it in your group’s Slack channel, and when we come back we’ll ask Sammi to judge the top three for 15, 10 and 5 PSG Points!'''


# Import libraries (wordcloud will need to be installed)
from wordcloud import WordCloud, STOPWORDS
import string
import matplotlib.pyplot as plt


import cairosvg
from PIL import Image
import numpy as np



with open("starmer_ks.txt", "r") as f:
    full_text = f.read()

stopwords = set(STOPWORDS)
additional_stopwords = {"bill", "will", "government", "legislation"}
stopwords = STOPWORDS.union(additional_stopwords)

tokens = full_text.split()
punctuation_mapping_table = str.maketrans('', '', string.punctuation)
tokens_stripped_of_punctuation = [token.translate(punctuation_mapping_table) for token in tokens]
lower_tokens = [token.lower() for token in tokens_stripped_of_punctuation]
joined_string = (" ").join(lower_tokens)

colormap = 'nipy_spectral'
wordcloud = WordCloud(width=1800,
                    height=1800,
                    background_color='black',
                    stopwords=stopwords,
                    colormap=colormap,
                    min_font_size=30).generate(joined_string)

plt.figure(figsize=(30,40))
plt.axis("off")
plt.imshow(wordcloud)
plt.savefig("starmer.png")

with open("johnson_qs.txt", "r") as f:
    full_text = f.read()

mask = np.array(Image.open('queen.png'))

tokens = full_text.split()
punctuation_mapping_table = str.maketrans('', '', string.punctuation)
tokens_stripped_of_punctuation = [token.translate(punctuation_mapping_table) for token in tokens]
lower_tokens = [token.lower() for token in tokens_stripped_of_punctuation]
joined_string = (" ").join(lower_tokens)

colormap = 'nipy_spectral'
wordcloud = WordCloud(width=1800,
                    height=1800,
                    background_color='black',
                    stopwords=stopwords,
                    colormap=colormap,
                    mask=mask,
                    min_font_size=30).generate(joined_string)

plt.figure(figsize=(30,40))
plt.axis("off")
plt.imshow(wordcloud)
plt.savefig("johnson.png")


with open("may_qs.txt", "r") as f:
    full_text = f.read()


tokens = full_text.split()
punctuation_mapping_table = str.maketrans('', '', string.punctuation)
tokens_stripped_of_punctuation = [token.translate(punctuation_mapping_table) for token in tokens]
lower_tokens = [token.lower() for token in tokens_stripped_of_punctuation]
joined_string = (" ").join(lower_tokens)

colormap = 'nipy_spectral'
wordcloud = WordCloud(width=1800,
                    height=1800,
                    background_color='grey',
                    stopwords=stopwords,
                    colormap=colormap,
                    min_font_size=30).generate(joined_string)

plt.figure(figsize=(30,40))
plt.axis("off")
plt.imshow(wordcloud)
plt.savefig("may.png")


with open("johnson_qs.txt", "r") as f:
    full_text = f.read()



tokens = full_text.split()
punctuation_mapping_table = str.maketrans('', '', string.punctuation)
tokens_stripped_of_punctuation = [token.translate(punctuation_mapping_table) for token in tokens]
lower_tokens = [token.lower() for token in tokens_stripped_of_punctuation]
joined_string = (" ").join(lower_tokens)

colormap = 'nipy_spectral'
wordcloud = WordCloud(width=1800,
                    height=1800,
                    background_color='black',
                    stopwords=stopwords,
                    colormap=colormap,
                    min_font_size=30).generate(joined_string)

plt.figure(figsize=(30,40))
plt.axis("off")
plt.imshow(wordcloud)
plt.savefig("johnson.png")



# Convert SVG to PNG
cairosvg.svg2png(url='crown.svg', write_to='image.png')

# Open the PNG image and convert it to a NumPy array
mask = np.array(Image.open('image.png'))




# Generate the word cloud with the mask
colormap = 'nipy_spectral'
wordcloud = WordCloud(width=1800,
                    height=1800,
                    background_color='black',
                    stopwords=stopwords,
                    colormap=colormap,
                    mask=mask,
                    min_font_size=30).generate(joined_string)

# Plot and save the word cloud
plt.figure(figsize=(30,40))
plt.axis("off")
plt.imshow(wordcloud, interpolation='bilinear')
plt.savefig("wordcloud_with_mask.png")