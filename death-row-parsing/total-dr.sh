bash tx-dr.sh | sed 's/White/TX,White/' | sed 's/Black/TX,Black/' | sed 's/Hispanic/TX,Hispanic/' | sed 's/Other/TX,Other/' | sed 's/Native    American/TX,Native American/'

bash fl-dr.sh | sed 's/BM/FL,Black/' | sed 's/BF/FL,Black/' | sed 's/WM/FL,White/' | sed 's/WF/FL,White/' | sed 's/HM/FL,Hispanic/' | sed 's/HF/Fl,Hispanic/' | sed 's/OM/FL,Other/' | sed 's/OF/FL,Other/'

bash ca-dr.sh | sed 's/BLA/CA,Black/' | sed 's/WHI/CA,White/' | sed 's/HIS/CA,Hispanic/' | sed 's/OTH/CA,Other/'
