# Brainstorming

## Parliamentary transcripts

There is a labelled dataset of parliamentary transcripts from the the UK House of Commons, that has been labelled for sentiment analysis 1997-2017. Could use this to train a model to predict sentiment of speakers in the House of Commons.
https://data.mendeley.com/datasets/xsvp45cbt4/2

Description: 
> A corpus of Hansard UK Parliament Debates for use in the evaluation of sentiment analysis systems.
> The corpus consists of 1251 motion-speech units taken from 129 separate debates from the UK House of Commons 1997-2017.


> Each speech has two sentiment polarity labels:
> 1. A speaker-vote label extracted from the division associated with the corresponding > debate; and: 
> 2. A manually assigned label.

> In addition, the following metadata is included with each unit: debate id, speaker party affiliation, motion party affiliation, speaker name, and speaker rebellion rate.
> The corpus is published as a CSV file with the following comma separated values:


> Each unit comprises a parliamentary speech of up to five utterances and an associated debate motion. Debates comprise between one and 30 speeches, and speeches range in length from 31 to 1049 words, with a mean of 167.8 words. The debates cover a two decade period from 1997 to 2017 and a wide range of topics from domestic and foreign affairs to procedural matters concerning the running of the House.

> Each motion has two sentiment polarity labels:
> 1. A manually applied sentiment polarity label ; and
> 2. A label derived from the relationship of the MP who proses the motion to the > Government.


> In addition, the following metadata is included with each unit: debate id, speaker party affiliation, motion party affiliation, speaker name, and speaker rebellion rate.
> The corpus is published as a CSV file with the following comma separated values:

> id, title, motion, manual motion, govt/opp motion ,motion party affiliation, utt1, utt2, utt3, utt4, utt5, manual speech, vote speech, party affiliation, name, rebellion %

> id: a unique ID number given to each debate.
> title: the title of the debate
> motion: the debate motion as proposed by a Member of Parliament
> manual motion: gold standard manually annotated sentiment polarity label applied to the motion. '1' = positive, '0' = negative.
> govt/opp motion: a sentiment polarity label applied to the motion derived from the relationship of the MP who proposes it to the current Government: '1' if they are affiliated with the governing party or coalition, '0' otherwise.
> motion party affiliation: the political party to which the MP who proposes the motion belongs.
> utt1 - utt5: utterances 1 to 5 of the speaker's speech.
> manual speech: gold standard manually annotated sentiment polarity label applied to the speech. '1' = positive, '0' = negative.
vote speech: a sentiment polarity label applied to the speech derived from speaker's division vote. 'Aye' = '1' = positive, 'No' = '0' = negative.
party affiliation: the political party to which the speaker.
name: name of the speaker.
rebellion %: rate at which the speaker rebels against the majority of members of their own party as a percentage of their total votes during that parliament.


There is a second or updated set to 2019
https://data.mendeley.com/datasets/czjfwgs9tm/1
could use sentiment analysis from the first corpus to see if the sentiment is related to whether the speaker was for or against the government (https://data.mendeley.com/datasets/czjfwgs9tm/1) for instance; does sentiment correspond to party. 

Abercrombie, Gavin (2020), “ParlVote:  A Corpus for Sentiment Analysis of Political Debatess”, The University of Manchester, V1, doi: 10.17632/czjfwgs9tm.1

Use it to identify a list of rebels, or a list of loyalists?
Could use it to identify the most common words used by each party, or the most common words used by the government and the opposition.

We could look over time to see if the degree of contention between the government and non-government parties changes.

This dataset was compiled from public sources, and it would be possible to develop a system to continuously download and update it.

Looking at the degree of sentiment analysis agreement between government (G) and non-government (NG) speakers over time could be interesting.

My hypothesis is that the degree of contention between G and NG speakers will increase over time, and that agreement would be a peak just after any election where there is a change of government.

(I would be interested to see if we could measure linguistic complexity and see if there is a difference between parties, and between ministers and backbenchers.)

## How to divide labour?

Tasks: 
1.  Develop slide for presentation this morning/pitch to the group
2.  use the labeled data to train a model to predict sentiment of speakers in the House of Commons.
3.  apply model to unlabelled data to predict sentiment of speakers in the House of Commons.
4.  use sentiment analysis from the first corpus to see if the sentiment is related to whether the speaker was for or against the government (https://data.mendeley.com/datasets/czjfwgs9tm/1) for instance; does sentiment correspond to party.
5.  Reproduce the workflow to download updated dataset and retest as described in https://aclanthology.org/2020.lrec-1.624.pdf
6.  Visualisation of results
7.  Develop an app that can run in the background updating and publishing dataset to github (or wherever)