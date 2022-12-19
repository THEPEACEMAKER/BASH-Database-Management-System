#!/bin/bash

tableData="$currDB/$tableName.idb"
tableFormat="$currDB/.$tableName.frm"

awk -F: 'BEGIN { ORS=":" }; { print $1 }' $tableFormat
printf "\n"
cat $tableData

echo ""
. ./tableMenu.sh
