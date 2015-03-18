mkdir data-hold

twitter1=$1
timestamp=$(date '+%Y-%m-%d_%H00')

mkdir data-hold/$timestamp

file1=data-hold/$timestamp/$twitter1-tweets.csv

echo "Fetching tweets for @$twitter1 at $timestamp."
t search all -n 3200 --csv @$twitter1 > $file1

twitter2=$2

file2=data-hold/$timestamp/$twitter2-tweets.csv

echo "Fetching tweets for @$twitter2 at $timestamp."
t search all -n 3200 --csv @$twitter2 > $file2

echo "Finding users who have mentioned @$twitter1 and @$twitter2."

#Call Detect.sh
bash detect.sh $file1 $file2 $timestamp $twitter1 $twitter2


#Call Matcher.sh
bash matcher.sh $file1 data-hold/realusers1.txt

bash matcher2.sh $file2 data-hold/realusers2.txt

#Call Calculator
bash calculator.sh data-hold/matched1.txt data-hold/matched2.txt $twitter1 $twitter2 $timestamp
