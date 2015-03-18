user1=$1
user2=$2

poscount1=0
while read posdic
do
  	echo  "Searching for" $posdic " in @"$3"'s tweets."
	if grep -Fxqi $posdic $user1
	then
   	  poscount1=$((poscount1+1))
	fi
done < dictionaries/positive-words.txt



negcount1=0
while read negdic
do
        echo  "Searching for" $negdic " in @"$3"'s tweets."
        if grep -Fxqi $negdic $user1
        then
          negcount1=$((negcount1+1))
        fi
done < dictionaries/negative-words.txt




#
#	Calculate for user 2
#
poscount2=0
while read posdic
do
        echo  "Searching for" $posdic " in @"$4"'s tweets."
        if grep -Fxqi $posdic $user2
        then
          poscount2=$((poscount2+1))
        fi
done < dictionaries/positive-words.txt
 

negcount2=0
while read negdic
do
        echo  "Searching for" $negdic " in @"$4"'s tweets."
        if grep -Fxqi $negdic $user2
        then
          negcount2=$((negcount2+1))
        fi
done < dictionaries/negative-words.txt


echo "Of the most recent 3200 tweets mentioning @"$3 "and @"$4" @" $5"..."
echo "Found " $poscount1 " of positive words directed towards @"$3
echo "Found " $negcount1 " of negative words directed towards @"$3
echo "Number of bots found for @"$3":"
cat data-hold/botcount1.txt | wc -l
echo "Found " $poscount2 " of positive words directed towards @"$4
echo "Found " $negcount2 " of negative words directed towards @"$4
echo "Number of bots found for @"$4":"
cat data-hold/botcount2.txt | wc -l
