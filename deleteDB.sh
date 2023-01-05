#!/bin/bash

clear -x;
read -rp "Enter Database name: " databaseName;

while ! [[ $currDB =~ ^([a-zA-Z])[a-zA-Z0-9\w_-]*([a-zA-Z0-9])$ ]]; do
    echo "$currDB is not a valid name";
    echo "database names should not have any special characters, spaces, doesn't start with a number or end with a '-' or '_'";
    echo ""
    read -rp "Enter database name: " currDB;
done

if [ -d  "Databases/$databaseName" ]; then
    rm -r Databases/$databaseName
    echo "$databaseName database  deleted Successfully"
    echo ""
    ./DBMenu.sh
  else
    echo "No such Database"
    echo ""
    ./DBMenu.sh
fi
