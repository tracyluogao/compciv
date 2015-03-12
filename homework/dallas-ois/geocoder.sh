mkdir -p tables
mkdir -p data-hold/geocodes

echo "location|latitude|longitude|" >> tables/geocodes.psv
cat data-hold/*.html | pup 'table table tr json{}' | jq '.[] .children | { 
case_pdf_href: .[0] .children[0] .href, 
case_id: .[0] .children[0] .text, 
date: .[1] .text ,
address: .[2] .text,
suspect_status: .[3] .text,
suspect_weapons: .[4] .text,
suspects: .[5] .text,
officers: .[6] .text,
grand_jury: .[7] .text
}' | jq -r '.address' | grep -v "Location" | 
while read -r x; do 
loc=$(echo $x | tr ' ' '+')
url="https://maps.googleapis.com/maps/api/geocode/json?address=$loc+Dallas+TX"
if [[ -s "data-hold/geocodes/$loc.json" ]]; then
echo "Already Downloaded data-hold/geocodes/$loc.json"
else
echo "Fectching location from $url"
curl -s $url > data-hold/geocodes/$loc.json
sleep 2
fi
latitude=$(cat data-hold/geocodes/$loc.json | jq '.results[0].geometry.location.lat')
longitude=$(cat data-hold/geocodes/$loc.json | jq '.results[0].geometry.location.lng')
echo "$x|$latitude|$longitude" >> tables/geocodes.psv
done
