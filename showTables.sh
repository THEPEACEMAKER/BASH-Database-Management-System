#!/bin/bash

# currDB="Databases/iti" 	# for easy access

DIR="./$currDB"
if [ -d "$DIR" ] && [ "$(ls -A $DIR)" ]; then
   echo "Available tables"
  ls $DIR | awk 'BEGIN{FS="."}{ print $1 }'
  echo ""
  . ./tablesMenu.sh
else
    echo "No tables to show"
    echo ""
    . ./tablesMenu.sh
fi
