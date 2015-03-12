mkdir data-hold

curl -s http://www.dallaspolice.net/ois/ois.html > data-hold/ois_present.html

urls=$(cat data-hold/ois_present.html | pup 'a attr{href}' | grep "/ois/ois_20")

for url in $urls; do 
  file=$(echo $url | tr '/' '-')
  curl http://www.dallaspolice.net$url > data-hold/$file
done

pdfs=$(cat data-hold/*.html | pup 'a attr{href}' | grep "/ois/docs/narrative/")

mkdir data-hold/pdfs

for pdf in $pdfs; do
  filename=$(echo $pdf | tr '/' '-')
  curl http://www.dallaspolice.net$pdf > data-hold/pdfs/$filename
done
