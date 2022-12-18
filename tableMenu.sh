#!/bin/bash

echo "-------$tableName-------";
echo "------------------------";

options=("Insert" "Select" "Update" "Delete" "Return To Previous Menu");

select option in "${options[@]}"
do
    case $option in
        "Insert") . ./insert.sh;;
        "Select") echo "Select";;
        "Update") echo "Update";;
        "Delete") echo "Delete";;
        "Return To Previous Menu") . ./tablesMenu.sh;;
        *) echo "Invalid option $REPLY";;
    esac
done