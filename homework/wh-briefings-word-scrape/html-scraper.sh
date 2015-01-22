cat data-hold/* | pup "p text{}" > content.txt
cat data-hold/* | pup "div.legacy-para text{}" >> content.txt
cat content.txt | tr "[:upper:]" "[:lower:]" | grep -oiE '[[:alpha:]]{7,}' | sort | uniq -c | sort -r | head -n 10
