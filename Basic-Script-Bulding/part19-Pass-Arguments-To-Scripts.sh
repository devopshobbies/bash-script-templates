#!/bin/bash
# Arguments passed to script from the command line, can be accessed using the "$" notation.
  
# The arguments "Arg1" and "Arg2" are passed to this script by the following notation: 
# sh part19-Pass-Argument-To-Script.sh Arg1 Arg2
# They can be refrenced in the script as $1 and $2. Please note that $0 is reserved for the name of the script.
# This notaion supports up to 9 inputs. If you want to go beyond that limit you have to  put {} around the number like ${10}.


#======= Examples =========

# sh part19-Pass-Argument-To-Script
echo $0 # output : part19-Pass-Argument-To-Script.sh 



# sh part19-Pass-Argument-To-Script.sh Arg1 Arg2
echo $1 # output : Arg1
echo $2 # output : Arg2
