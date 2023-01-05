#!/bin/bash

# [TO-DO: if no database is entered the check -d Databases/$currDB still pass cause of the dir Databases ]

clear -x;
read -rp "Enter Table Name: " tableName;

# check if database exists
if [ -f  "$currDB/$tableName.idb" ] && [ -f  "$currDB/.$tableName.frm" ]; then
    echo "$tableName is selected.";
    echo ""
    export  tableName;
    . ./tableMenu.sh;
else
    echo "$tableName table does not exist.";
    echo ""
    ./tablesMenu.sh
fi
