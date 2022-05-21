#!/bin/bash

# The C-Style for Command Statement :
# for (( variable assignment ; condition ; iteration process ))

# testing the C-style for loop

for (( i=1; i ‹= 10; i++ ))
do
echo "The next number is $i"
done

# An example of for loops (C-Style)

let TMP=0

echo -n "Enter Number between (5 to 9): "
read TMP

if ! [ $TMP -ge 5 -a $TMP -le 9 ]; then
        echo "pelese enter number between 5 and 9, Try Again."
        exit 1
fi


clear

for ((i = 1; i <= TMP; i++)); do

        for ((s = TMP; s >= i; s--)); do
                echo -n " "
        done

        for ((j = 1; j <= i; j++)); do
                echo -n " ."
        done

        echo ""

done

################### Second stage ######################

for ((i = TMP; i >= 1; i--)); do

        for ((s = i; s <= TMP; s++)); do
                echo -n " "
        done

        for ((j = 1; j <= i; j++)); do
                echo -n " ."
        done

        echo ""

done
