cd data-hold/scrapes/$1

yearly_jobs=$(cat *.json | jq '.JobData[] | select(.SalaryBasis == "Per Year")')
simple_rows=$(echo $yearly_jobs | jq '. | {JobTitle, SalaryMin, SalaryMax}')

while read line; do

title=$(echo $line | grep -oE '[[:alpha:]].+')
rows=$(echo $simple_rows | jq "select(.JobTitle == \"$title\")" )
min=$(echo $rows | jq -r '.SalaryMin' | tr -d '$' | tr -d ',' | sort -n | head -n 1)
max=$(echo $rows | jq -r '.SalaryMax' | tr -d '$' | tr -d ',' | sort -rn | head -n 1)

echo "$title | $min | $max"

done < <(echo $yearly_jobs | jq -r '.JobTitle' | sort | uniq -c | sort -rn | head -n 25)
