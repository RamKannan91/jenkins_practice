#!/bin/bash

#ls -1 f1 > ../folder1.txt
#ls -1 f2 > ../folder2.txt

folder1Name="f1"
folder2Name="f2"
folder3Name="f3"
differenceFileName="differenceFile.txt"

### Find the difference between the base folder and the required folder and it saves the missing files in the differenceFile.txt
diff -arq $folder1Name $folder2Name | cut -d ':' -f2  | sed -e 's/^[ \t]*//' > $differenceFileName

### Iterate through the missing files list and add the missing files to the third folder..
while IFS= read -r var
do
  echo "Missing File ==== $var (Adding it to $folder3Name)"
  cp -r "$folder1Name/$var" "$folder3Name/"
done < $differenceFileName