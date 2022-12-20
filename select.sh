#!/bin/bash

echo "-------$tableName-------";
echo "--------SELECT--------";

options=("All" "Column" "By Column" "Return To Previous Menu");

select option in "${options[@]}"
do
    case $option in
        "All") . ./displayTable.sh;;
        "Column") . ./selectColumn.sh;;
        "By Column") . ./selectByColumn.sh;;
        "Return To Previous Menu") . ./tableMenu.sh;;
        *) echo "Invalid option $REPLY";;
    esac
done