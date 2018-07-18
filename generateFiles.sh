#!/bin/bash

file1Name="filea.txt"
file2Name="fileb.txt"
file3Name="fileDiff.txt"
fileAContents="fileAContentsFull.txt"
fileBContents="fileBContentsFull.txt"

echo "" > $fileAContents
echo "" > $fileBContents
echo "" > $file3Name

while IFS= read -r linea; do
	a=$(echo $linea | cut -d "." -f1 | awk -F/ '{print $1,$NF}' | sed -e 's/^[ \t]*//')
	b=$(echo $linea | cut -d "." -f2)
	fileaString=$a.$b
	echo "$fileaString" >> $fileAContents
done < <(grep "" $file1Name)

echo "**********************************************************"

while IFS= read -r lineb; do
  filebString="$(echo $lineb | cut -c 32-1000 | sed -e 's/^[ \t]*//')"
  echo "$filebString" >> $fileBContents
done < <(grep "" $file2Name)

sed -i "" '/^\s*$/d' $fileAContents
sed -i "" '/^\s*$/d' $fileBContents

cat $fileAContents
cat $fileBContents
