#!/bin/bash

# if-then-Statement:
# if command
# then
# commands
# fi

# testing multiple commands in the then section

testuser=rich
if grep $testuser /etc/passwd
then
echo The bash files for user $testuser are:
ls -a /home/$testuser
fi



# To Answer :
# useradd rich
# passwd rich
# change to root and :
# cd /home/rich
# touch test.txt
# Run the Bashscript file

