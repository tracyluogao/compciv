csv1=$1
csv2=$2
timestamp=$3
user1=$4
user2=$5

csvfix order -fn  'Screen name' $csv1 > data-hold/$timestamp/mentioners1.txt

cat data-hold/$timestamp/mentioners1.txt | tr -d '"' | sed -e '1d'  > data-hold/$timestamp/$user1-mentions.txt

csvfix order -fn  'Screen name' $csv2 > data-hold/$timestamp/mentioners2.txt

cat data-hold/$timestamp/mentioners2.txt | tr -d '"' | sed -e '1d'  > data-hold/$timestamp/$user2-mentions.txt



#
#	Work on Twitter 1
#

while read line
do
	t whois @$line  --csv >> data-hold/$timestamp/follower.csv
	sleep 3
done < data-hold/$timestamp/$user1-mentions.txt

csvfix order -fn 'Screen name','Tweets' data-hold/$timestamp/follower.csv > data-hold/$timestamp/userstweets1.txt

cat data-hold/$timestamp/userstweets1.txt | tr -d '"' | sed -e 's/\<Screen name\>//g'| sed -e 's/\<Tweets\>//g' | tr ',' '\ ' | grep -v '^ *$'  > data-hold/$timestamp/finaltweets1.txt 

while read line
do
	bash comparer.sh $line 
done < data-hold/$timestamp/finaltweets1.txt




#
#	Work on Twitter 2 
#

while read line
do
	t whois @$line  --csv >> data-hold/$timestamp/follower2.csv
	sleep 3
done < data-hold/$timestamp/$user2-mentions.txt

csvfix order -fn 'Screen name','Tweets' data-hold/$timestamp/follower2.csv > data-hold/$timestamp/userstweets2.txt

cat data-hold/$timestamp/userstweets2.txt | tr -d '"' | sed -e 's/\<Screen name\>//g'| sed -e 's/\<Tweets\>//g' | tr ',' '\ ' | grep -v '^ *$'  > data-hold/$timestamp/finaltweets2.txt

while read line
do
        bash comparer2.sh $line
done < data-hold/$timestamp/finaltweets2.txt
