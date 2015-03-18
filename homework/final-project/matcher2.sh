csv1=$1
txt1=$2

touch data-hold/matched2.csv
echo "ID,Posted at,Screen name,Text" >> data-hold/matched2.csv
while read line
do
        grep $line $csv1 >> data-hold/matched2.csv
done < $txt1

csvfix order -fn 'Text' data-hold/matched2.csv | sed -e '1d' > data-hold/matched2.txt
rm data-hold/matched2.csv
