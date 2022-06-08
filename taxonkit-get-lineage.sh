
#!/bin/bash
#Taxonkit get lineage

cat $1 \
    | taxonkit lineage \
    --data-dir ~/Documents/new_taxdump/ \
    -o ./${1}_lineage &&

cat ./${1}_lineage \
    | taxonkit reformat \
    --data-dir ~/Documents/new_taxdump/ \
    --miss-rank-repl "__" \
    | csvtk -H -t cut -f 1,3 \
    | csvtk -H -t sep -f 2 -s ';' -R \
    | csvtk add-header -t -n taxid,kingdom,phylum,class,order,family,genus,species \
    -o ./${1}_reformat.csv
    
