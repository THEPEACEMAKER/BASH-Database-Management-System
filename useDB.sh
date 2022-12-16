#!/bin/bash

read -p "Enter Database name: " currDB;

# check if database exists
if [[ -d {Databases/$currDB} ]]
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
