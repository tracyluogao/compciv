user=$1
tweets=$2

touch data-hold/realusers2.txt
touch data-hold/botcount2.txt



if [[ $tweets -ge 10 ]]; then
        echo $user >> data-hold/realusers2.txt
elif [[ $tweets -lt 10 ]]; then
        echo $user >> data-hold/botcount2.txt
fi
