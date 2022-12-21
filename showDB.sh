#!/bin/bash

DBsDir="./Databases"
if [ -d "$DBsDir" ] && [ "$(ls -A $DBsDir)" ]; then
   echo "Available Databases"
  ls $DBsDir
  echo ""
  ./DBMenu.sh
else 
    echo "No Databases to show"
    echo ""
    ./DBMenu.sh
fi
