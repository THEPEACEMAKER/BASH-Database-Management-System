#!/bin/bash

# for debugging
# currDB="Databases/iti"
# tableName="emp";

tableData="$currDB/$tableName.idb"
tableFormat="$currDB/.$tableName.frm"

awk -F: 'BEGIN { ORS=":" }; { print $1 }' $tableFormat | sed 's/.$//'
printf "\n"
cat $tableData

echo ""
. ./tableMenu.sh
