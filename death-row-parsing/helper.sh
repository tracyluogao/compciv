mkdir -p data-hold

cd data-hold

curl -o texasoffenders.html http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html

curl -o texasoffenders1923.html http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html

curl -o floridaroster.html http://www.dc.state.fl.us/activeinmates/deathrowroster.asp

curl -o floridalist1976.html http://www.dc.state.fl.us/oth/deathrow/execlist.html

curl -o floridalist1924.html http://www.dc.state.fl.us/oth/deathrow/execlist2.html

curl -o californialist.pdf http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf

pdftotext californialist

cd ..
