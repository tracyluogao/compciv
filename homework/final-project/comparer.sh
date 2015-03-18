user=$1
tweets=$2

touch data-hold/realusers1.txt
touch data-hold/botcount1.txt

if [[ $tweets -ge 10 ]]; then
	echo $user >> data-hold/realusers1.txt
elif [[ $tweets -lt 10 ]]; then
	echo $user >> data-hold/botcount1.txt
fi
