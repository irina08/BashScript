#!/bin/bash
# Irina Golovko
# Hw# 4 task 3

# This script will run both of previous scripts.  It will take zero or 1 parameters.
#  It produce an error message and exit if there are more than 1 parameter given.
#The optional parameter will be a directory path.  If none is given, use the current directory ".".

# run scripts with optional parameter given by user  

if [ "$#" -eq 1 ]; then 
echo "Executions of script Hw4_1.sh with given argument $1"
source Hw4_1.sh $1 
echo "Executions of script Hw4_2.sh with given argument $1"
source Hw4_2.sh $1 
exit 0
fi

# run script without given parametrs by default - current directory
if [ "$#" -eq 0 ]; then
echo "Executions of script Hw4_1.sh without given argument"
echo "Argument by default is current directory $PWD"	
source Hw4_1.sh $PWD 

echo "Executions of script Hw4_2.sh without given argument"
echo "Argument by default is current directory $PWD"
source Hw4_2.sh $PWD 

exit 0
fi

if [ "$#" -gt 1 ]; then
	echo "Error: More than one parameter given"
	exit 1;
fi



