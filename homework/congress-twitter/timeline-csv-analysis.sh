username=$1

dir=data-hold/$username-timeline.csv
echo "Fetching tweets for $username into $dir"
t timeline -n 3200 --csv $username > $dir

tweetnumber=$(csvfix order -fn 'ID' $dir | wc -l)
oldesttweet=$(csvfix order -fn 'Posted at' $dir | tail -n 1)
echo "Analyzing $tweetnumber tweets by $username since $oldesttweet"

echo "Top 10 hashtags by $username"
csvfix order -fn 'Text' $dir | grep -oiE '#[a-z,0-9,_]+\b' | tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10

echo "Top 10 retweeted users by $username"
csvfix order -fn 'Text' $dir | grep -oiE 'RT @[a-z,0-9,_]+\b' | tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10

echo "Top 10 mentioned users (not including retweets) by $username"
csvfix order -fn 'Text' $dir | grep -viE 'RT' | grep -oiE '@[a-z,0-9,_]+\b' | tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10

echo "Top tweeted 10 words with 5+ letters by $username"
csvfix order -fn 'Text' $dir | grep -oiE '[[:alpha:]]{5,}' | grep -viE '@[a-z,0-9,_]' | grep -viE $username | grep -viE '#[a-z,0-9,_]' | grep -viE 'http.+\b' | tr [[:upper:]] [[:lower:]] | sort | uniq -c | sort -rn | head -n 10
