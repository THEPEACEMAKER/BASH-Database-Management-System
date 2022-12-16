#!/bin/bash

read -p "Enter Database name: " databaseName;

if [ -d  "Databases/$databaseName" ]; then
    rm -r Databases/$databaseName
    echo "$databaseName database  deleted Successfully"
  else
    echo "No such Database"
fi
