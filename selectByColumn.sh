#!/bin/bash

# for debugging
# currDB="Databases/iti"
# tableName="emp";

tableData="$currDB/$tableName.idb"
tableFormat="$currDB/.$tableName.frm"

columns=()
dataTypes=()

# get column names and dataTypes
read -d '\n' -r -a lines < "$tableFormat"
for i in "${!lines[@]}" # each line of the format table
do
  IFS=':' read -r -a column <<< "${lines[i]}"; # get parts of that particular line

  name=${column[0]};
  dataType=${column[1]};

  columns+=($name)
  dataTypes+=($dataType);
done

clear -x;
echo "---------------------------------------------";
echo "------Columns in the $tableName table--------";

# show columnNames as options
select column in ${columns[@]};
do
    let colIndex=($REPLY)
    colname="${columns[$((colIndex-1))]}"
    colDataType="${dataTypes[$((colIndex-1))]}"

    clear -x;
    echo "-------------";
    echo "Column: $column, Data Type: $colDataType"

    #read new value from user
    read -p "Enter $colname: " value;

    # validate the new value type
    if [[ $colDataType == "number" ]]; then
        while ! [[ $value =~ ^[0-9]+$ ]]; do
        	echo "";
        	clear -x;
            echo "$colname must be a number.";
            echo ""
            read -p "Enter $colname: " value;
        done
    elif [[ $colDataType == "string" ]]; then
        while ! [[ $value =~ ^[a-zA-Z]+$ ]]; do
        	clear -x;
        	echo "";
            echo "$colname must be a string.";
            echo ""
            read -p "Enter $colname: " value;
        done
    fi

    clear -x;
	echo "-----------query Results----------";
	awk -v i="$colIndex" -v v=$value -F':' '{if ($i == v) print $0;}' $tableData # display the rows that have the queried value

	break;
done

echo "";
echo "";
echo "------------------------";
options=("Make Another Query" "Return To The Select Menu" "Return To The Table Menu");

select option in "${options[@]}"
do
    case $option in
        "Make Another Query") . ./selectByColumn.sh;;
        "Return To The Select Menu") . ./select.sh;;
        "Return To The Table Menu") . ./tableMenu.sh;;
        *) echo "Invalid option $REPLY";;
    esac
done
