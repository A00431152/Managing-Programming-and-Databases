#!/bin/bash

# reads each ".txt" file in the given folder, where the 1st line of 
# each file is the title; for each file, itmakes a json object with 
# three fields: "file_name", "title", "content", where it replaces 
# any double quotes and \n's in the title/content with spaces

if [ $# -ne 4 ]
then
    printf "\nUsage: \n\$ $0 <folder/> <collection> <database> <user>  \n\n"
    exit 1
fi

printf "\nMongodb password: "
read -s pass

folder="$1"
coll="$2"
db="$3"
user="$4"

cd $folder
files=$(ls *.txt)

printf "\nImporting from folder \"$folder\"\n-\n"
for c in $files ;
do
	echo "$c translated as json file $c.json"
    echo "$c" | python ../txt2json.py > "$c.json"
    mongoimport -d "$db" -u "$user" -p "$pass" -c "$coll" --file "$c.json"
    rm "$c.json"
done

cd ..

echo

