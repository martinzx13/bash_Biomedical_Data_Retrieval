#!/bin/bash

C_1="$1"
C_2="$2"

if [[ -z "$C_1" && -z "$C_2" ]]; then
  exit 1
fi

# Create file.

touch mycompunds.csv

# Write the name in the file.
cat <<EOF >mycompunds.csv
CHEBI:"$C_1", manganese(2+)
CHEBI:"$C_2", monoatomic dication
EOF

# Retrive the information and print the first lines
curl -s "https://www.ebi.ac.uk/ebisearch/ws/rest/chebi/entry/"$C_1"/xref/UniProtKB?size=100&format=csv" | head -n 5
curl -s "https://www.ebi.ac.uk/ebisearch/ws/rest/chebi/entry/"$C_2"/xref/UniProtKB?size=100&format=csv" | tail -n 5
