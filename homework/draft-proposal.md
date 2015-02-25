For our project, we plan to analyze tweets of congress members who are up for
re-election in order to get a sense of general public approval for candidates.
In order to do this, we will analyze the most recent 3200 tweets mentioning
any particular candidate(s) and classify each tweet as either "positive" or
"negative." After classifying all tweets, our goal is to be able t
"predict," based on the percentage of positive vs. negative tweets, whether
or not the candidate(s) will be elected.

Before discerning the valence of each tweet, our program will filter out
any users perceived to be "bots" or spam/automated accounts. The program
will then search each tweet for the inclusion of words associated with
positive and negative sentiments - these words will come from one of (or
a combination of) pre-determined "sentiment lexicons" that currently exist
for content analysis purposes. Additionally, the program will also categorize
each tweet according to the respective region of the country the person
tweeting is from. Finally, the program will output the number of spam
accounts filtered out, the overall percentage of positive and negative tweets
for the candidate(s), and a breakdown of positive/negative tweets by region
for the candidate(s). If more than one candidate is entered as a query, the
program will also "predict" which candidate is more likely to win an election
(based on positive/negative tweets). 

Potential problems or difficulties that we may run into are and/or limitations:
	-	only the 3200 most recent tweets are available to us - for a
		longer election period this may leave us with an incomplete set
		of data for congress members
	-	tweets that are ironic or convey sarcasm will be near impossible
		to detect (ie. wow obama is the best! i love him for what he has 
		done to our country :):):))
	-	tweets that mention a congress member/candidate that ALSO
		mention other people so that it is unclear who the actual
		message is directed to - could be ambiguous
