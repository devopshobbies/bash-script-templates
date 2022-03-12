### Function ###
fun_name ( ) {
cmd1
cmd2
...
}


### Using brackets ###
sum=$[ $var1 + $var2 ]


### Using bc ###
variable=`bc << EOF
options
statements
expressions
EOF
`


### if-then Statement ###
if command
then
commands
fi


### if-then-else Statement ###
if command
then
commands
else
commands
fi


### Nesting ifs ###
if command1
then
command set 1
elif command2
then
command set 2
elif command3
then
command set 3
elif command4
then
command set 4
fi


### The case Command ###
case variable in
pattern1 | pattern2) commands1;;
pattern3) commands2;;
*) default commands;;
esac


### The for Command ###
for var in list
do
commands
done


### The C-Style for Command ###
for (( variable assignment ; condition ; iteration process ))
do
commands
done


### The while Command ###
while test command
do
other commands
done


### The until Command ###
until test commands
do
other commands
done
