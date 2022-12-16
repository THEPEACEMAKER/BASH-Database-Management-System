#!/bin/bash

echo "Enter database name: "
read currDB;

# check if database exists
if [[ -d Databases/$currDB ]]
then
    echo "$currDB is selected.";
    export  currDB=Databases/$currDB;
    . ./tablesMenu.sh;
else
    echo "Database does not exist.";
fi
