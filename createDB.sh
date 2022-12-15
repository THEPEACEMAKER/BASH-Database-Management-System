#!/bin/bash

read -p "Enter database name: " newDB;

while ! [[ $newDB =~ ^([a-zA-Z])[a-zA-Z0-9\w_-]*([a-zA-Z0-9])$ ]]; do
    echo "$newDB is not a valid name";
    echo "database names should not have any special characters, spaces, doesn't start with a number or end with a '-' or '_'";
    read -p "Enter database name: " newDB;
done

if test -d Databases/$newDB; then
    echo "This database already exists!";
else
    if mkdir -p Databases/$newDB 2>> log.out; then
        echo "$newDB database created succesfully";
    else
        echo "Falied to create $newDB. Refer to log.out for more details."
    fi
fi
