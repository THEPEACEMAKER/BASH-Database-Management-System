#!/bin/bash

read -rp "Enter Database name: " databaseName;

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
