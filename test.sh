#! /bin/bash

#Test file
newfile=$(mktemp)
echo "Created newfile" >> $newfile
cat $newfile

