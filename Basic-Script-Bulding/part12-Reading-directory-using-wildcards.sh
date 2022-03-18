#!/bin/bash

# iterate through all the files in a directory

for file in /home/rich/*
do
if [ -d "$file" ]
then
echo "$file is a directory"
elif [ -f "$file" ]
Then
echo "$file is a file"
fi
done

# For Answer :
# useradd rich
# In /home/rich/ :
# touch test-file
# mkdir test-directory
