#!/bin/bash

read -p "Enter table name: " tableName;

# Validate the entered name
while ! [[ $tableName =~ ^([a-zA-Z])[a-zA-Z0-9\w_-]*([a-zA-Z0-9])$ ]]; do
    echo "$tableName is not a valid name";
    echo "table names should not have any special characters, spaces, doesn't start with a number or end with a '-' or '_'";
    echo ""
    read -p "Enter table name: " tableName;
done

function createTableFiles(){
    currDB=$1;
    tableName=$2;

    success=0

    # create tableName.idb
    if touch "$currDB/$tableName.idb" 2>> log.out; then
        echo "Data table created sucessfully." >> log.out;
        # create tableName.frm
        if touch "$currDB/$tableName.frm" 2>> log.out; then
            echo "Format file created sucessfully." >> log.out;
        else
            echo "Falied to create the format file. Check log.out for more details.";
            success=1
        fi
    else
        echo "Falied to create data table. Check log.out for more details.";
        success=1
    fi

    echo $success;
}

# main
if test -f $currDB/$tableName 2> log.out; then
	echo "Table already exists. Check log.out for more details.";
else
    if [ $(createTableFiles "$currDB" "$tableName")  == 0 ]; then
    	echo "Table files created successfully" >> log.out;
    fi
fi
