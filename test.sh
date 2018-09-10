#! /bin/bash

#`start=SECONDS
SECONDS=0
#Test file
newfile=$(mktemp)
echo "Created newfile" >> $newfile
cat $newfile
cat $newfile
sleep 3
duration=$SECONDS
echo $duration
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds"
