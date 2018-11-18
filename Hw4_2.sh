#!/bin/bash
# Irina Golovko
# Hw# 4 task 2

# read files from files.txt and read  directories from dirs.txt
#$1="dirs.txt"
#$2="files.txt"

if [ "$#" -eq 2 ]; then
	for WORD in `cat $1`
do
	echo "Directory is $WORD"
done

for WORD in `cat $2`
do
	echo "File is $WORD"
        size=`(stat -f%z $WORD)`
	echo "Size is $size"
done
fi

# assume that we have only 1 parameter and it contains name of files.
# we need to read name of directories from name of files.
if [ "$#" -eq 1 ]; then
	if [ -f "$1" ]; then
		for WORD in `cat $1`
		do
			DIR=$(dirname "${WORD}")
			echo "File is $WORD"	
			echo "Directory is ${DIR}"
		done
	elif [ -d "$1" ]; then 
		echo "File and subdirectories in the directory $1"
		for filename in `ls -la $1`; do
			if [ -d ${1}/${filename} ]; then 
				echo "${1}/${filename} is a subdirectory"
			elif [ -f ${1}/${filename} ]; then
				echo "${1}/${filename} is a file"
			fi
		done 
	fi
fi
