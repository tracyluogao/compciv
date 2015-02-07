timestamp=$(date +%Y-%m-%d_%H00)
mkdir data-hold/scrapes/$timestamp

jobfamilies=$(cat data-hold/OccupationalSeries.xml | hxselect -c -s '\n' CodeList#OccupationSeriesFamily JobFamily)

for jobfamily in $jobfamilies; do
curl -so data-hold/scrapes/$timestamp/$jobfamily-1.json https://data.usajobs.gov/api/jobs?series=$jobfamily'&'NumberOfJobs=250
total_pages=$(cat data-hold/scrapes/$timestamp/$jobfamily-1.json | jq -r '.Pages')

if [[ $total_pages -gt 1 ]]; then

page_number=1

for page_number in $(seq 2 $total_pages); do
curl -so data-hold/scrapes/$timestamp/$jobfamily-$page_number.json https://data.usajobs.gov/api/jobs?series=$jobfamily'&'NumberOfJobs=250'&'Page=$page_number
done

fi

done
