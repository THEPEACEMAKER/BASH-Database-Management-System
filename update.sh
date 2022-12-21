#!/bin/bash

echo "-------$tableName-------";
echo "-------- Update ----------";

options=("Column" "By Column" "Return To Previous Menu");

select option in "${options[@]}"
do
    case $option in
        "Column") . ./updateColumn.sh;;
        "By Column") . ./updateByColumn.sh;;
        "Return To Previous Menu") . ./tableMenu.sh;;
        *) echo "Invalid option $REPLY";;
    esac
done