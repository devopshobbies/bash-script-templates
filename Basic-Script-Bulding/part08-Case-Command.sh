#!/bin/bash

# Case Command Statement :
# case variable in
# pattern1 | pattern2) commands1;;
# pattern3) commands2;;
# *) default commands;;
# esac

# using the case command

case $USER in
root | alex)
echo "Welcome, $USER"
echo "Please enjoy your visit";;
rich)
echo "Special testing account";;
jessica)
echo "Don’t forget to log off when you’re done";;
*)
echo "Sorry, you’re not allowed here";;
esac
