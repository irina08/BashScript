#!/bin/bash
# Irina Golovko
# Hw# 7 
# using script alias_function_library

# First we have to expand aliases in order to execute script with ./
# In other way we have to use command source for executing script
shopt -s expand_aliases

source /Users/irinagolovko/Documents/Unix/ShellScript/HW/IrinaGolovko_HW7_debugging/alias_function_library.sh

# We will illustrate the trap command before the program exits 
# when a user hits Control-C
# The trap command will ignore INT, signal 2, the interrupt key (^C). 
# If ^C is pressed, the message "Ctrl-C will not terminate the running process"
# is printed, and the script continues forever. 
# The script can be killed with the kill command or Ctrl^Z and etc.

trap '' 2
trap 'echo " Ctrl-C will not terminate the running process."' 2 

echo  "Enter any string after the prompt"
for i in 1 2 3
do 
echo -n "Go ahead...> "
read
done

echo "_________________________________________"

# Set value to variable that using alias setthat and function setval

setval that
echo "Value of variable that is: $that"
echo "__________________________________________"

# using alias dirW=echo Working directory is $PWD'
# for finding working directory
dirW
echo "__________________________________________"

# list of all files in working directory using alias l='dirW | ll'
echo "Files in working directory"
l
echo "__________________________________________________"

# files in given directory $dir with alias ll='ls -l $dir'
dir="/Users/irinagolovko/Documents/Unix/ShellScript/HW/lab"
echo "files in given directory $dir"
ll
echo "__________________________________________________"

# using alias ll='ls -l $dir' and function output_extension 
# and output_baseName for finding filename and extensions 
# of files in the given directory.

echo "Full File names, base name and name without extension"
for file in $(ll)
do
	if [ -d ${dir}/${file} ]; then
		echo "${dir}/${file} is a subdirectory"
	elif [ -f ${dir}/${file} ]; then
	  	output_baseName $file
		output_extension $file
	fi
done  
echo "____________________________________"

# using trap and clean_up function to be sure that all unnecessary 
# temporary stuff is gone
trap clean_up EXIT
