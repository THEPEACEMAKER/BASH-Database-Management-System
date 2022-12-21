#!/bin/bash

# [TO-DO: if no database is entered the check -d Databases/$currDB still pass cause of the dir Databases ]

read -rp "Enter Database name: " currDB;

# check if database exists
if [[ -d Databases/$currDB ]]
then
    echo "$currDB is selected.";
    echo ""
    export  currDB=Databases/$currDB;
    . ./tablesMenu.sh;
else
    echo "Database does not exist.";
    echo ""
    ./DBMenu.sh
fi
