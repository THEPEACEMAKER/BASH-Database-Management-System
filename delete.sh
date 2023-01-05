#!/bin/bash

clear -x;
echo "-------$tableName-------";
echo "--------Delete----------";

options=("By Column" "Return To Previous Menu");

select option in "${options[@]}"
do
    case $option in
        "By Column") . ./deleteByColumn.sh;;
        "Return To Previous Menu") . ./tableMenu.sh;;
        *) echo "Invalid option $REPLY";;
    esac
done