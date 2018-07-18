#!/bin/bash

file3Name="fileDiff.txt"
fileAContents="fileAContentsFull.txt"
fileBContents="fileBContentsFull.txt"

echo "" > $file3Name

while IFS= read -r var
do
  grep -E $var $fileBContents
  rc=$?; 
  echo "==> $rc"
  if [[ $rc == 0 ]]; then
  	echo "#"
  else
  	echo "NA"
  	echo $var >> $file3Name
  fi
done < "$fileAContents"

