#!/bin/bash

echo "-------$tableName-------";
echo "------------------------";

options=("Display Table" "Insert" "Select" "Update" "Delete" "Return To Previous Menu");

select option in "${options[@]}"
do
    case $option in
        "Display Table") . ./displayTable.sh;;
        "Insert") . ./insert.sh;;
        "Select") . ./select.sh;;
        "Update") echo "Update";;
        "Delete") echo "Delete";;
        "Return To Previous Menu") . ./tablesMenu.sh;;
        *) echo "Invalid option $REPLY";;
    esac
done