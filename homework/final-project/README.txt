This script uses two sentiment dictionaries:

1) Bing Liu's Opinion Lexicon (of negative and positive words): Includes misspellings, morphological variance, slang,
and social media markup.
The file and associated papers can be downloaded at: 
http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html

2) Loughran and McDonald's Financial Sentiment Dictionaries
The file and associated papers can be downloaded at:
http://www3.nd.edu/~mcdonald/Word_Lists.html

The combined list of both of these dictionaries can be found in dictionaries/positive-words.txt and
dictionaries/negative-words.txt

mainshell.sh will only be as efffective as the dictionaries are comprehensive. Adding more words to the positive
and negative lists will mean producing more accurate results.


HOW TO USE mainshell.sh:
mainshell.sh takes in TWO arguments, the twitter handles of two candidates without the "@" sign
example: bash mainshell.sh barackobama jebbush

mainshell.sh will search for the most recent 3200 tweets mentioning the two candidates.

mainshell.sh will detect any "spam bots" (considered to be any user with less than 10 tweets) and remove those
tweets from analysis.

mainshell.sh will analyze the remaining tweets for positive and negative words as dilineated in the dictionaries

mainshell.sh will display number of bots detected, number of positive words found, and number of negative words
found for each user searched.

PLEASE NOTE: mainshell.sh may take quite a long time to complete as "sleep" is called in order to prevent
reaching the twitter API rate limit.
