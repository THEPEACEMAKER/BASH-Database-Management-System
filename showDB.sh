#!/bin/bash

DBsDir="$(PWD)/Databases"
if [ -d "$DBsDir" ] && [ "$(ls -A $DBsDir)" ]; then
   echo "Available Databases"
  ls $DBsDir
else 
    echo "No Databases to show"
fi
