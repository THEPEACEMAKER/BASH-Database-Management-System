#!/bin/bash

tables_menu(){
    options=("Show Tables" "Create New Table" "Use Table" "Delete Table" "Display Table" "Return To Main Menu");

    select option in "${options[@]}"
    do
        case $option in
            "Show Tables") . ./showTables.sh;;
            "Create New Table") . ./createTable.sh;;
            "Use Table") . ./useTable.sh;;
            "Delete Table") . ./deleteTable.sh;;
            "Display Table") . ./displayTable.sh;;
            "Return To Main Menu") . ./DBMenu.sh;;
            *) echo "Invalid option $REPLY";;
        esac
    done
}

tables_menu
