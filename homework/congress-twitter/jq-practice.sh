

echo '1.'
cat data-hold/legislators-current.json | jq --raw-output '.[0] .name .last'

echo '2.'
cat data-hold/legislators-current.json | jq --raw-output '.[111] .id .bioguide'

echo '3.'
cat data-hold/legislators-current.json | jq --raw-output '.[13] .terms[2] .start'

echo '4.'
cat data-hold/legislators-current.json | jq --raw-output '.[4] | .name .first, .name .last, .bio .birthday'

echo '5.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .bio .birthday' | sort -r | head -n 10 

echo '6.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .bio .religion' | sort | uniq -c | sort -nr

echo '7.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[0] .start' | sort | cut -d '-' -f 1 | grep -c '2015'

echo '8.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[0] .start' | cut -d '-' -f 1 | sort | head -n 1

echo '9.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[-1:][0].party' | grep -c 'Republican'

echo '10.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[-1:][0].party' | grep -c 'Independent'

echo '11.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[] .rss_url' | grep -v 'null' | sort | uniq | head -n 10

echo '12.'
cat data-hold/legislators-social-media.json | jq '.[] .social .twitter' | grep -v 'null' | wc -l

echo '13.'
cat data-hold/legislators-social-media.json | jq '.[] .social .facebook' | grep -v 'null' | wc -l

echo '14.'
cat data-hold/legislators-social-media.json | jq --raw-output '.[] | [.id .bioguide, .social .twitter] | @csv' | head -n 10

echo '15.'
cat data-hold/legislators-social-media.json | jq --raw-output '.[] | [.id .bioguide, .social .twitter] | @csv' | grep  -v ',"'


echo '16.'
cat data-hold/congress-twitter-profiles.json | jq '.[] .verified' | grep 'true' | wc -l

echo '17.'
cat data-hold/congress-twitter-profiles.json | jq '.[] .followers_count' | sort -nr | head -n 1

echo '18.'
cat data-hold/congress-twitter-profiles.json | jq --raw-output '.[] | [.name, .screen_name, .followers_count, .verified, .created_at] | @csv' | head -n 10

echo '19.'
cat data-hold/congress-twitter-profiles.json | jq --raw-output '.[] | [.screen_name, .statuses_count, .followers_count, .status .created_at] | @csv' | head -n 10
