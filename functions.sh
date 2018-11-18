#!/bin/bash
# Irina Golovko
# Hw# 5 

# create function list_all_files which should generate 
# a list of all files in a given directory 
# (the directory should be a parameter to the function call).

list_all_files () {
	
    if [ ! -d $1 ] 
    then echo "Error message: $1 not a valid directory"; return;
    fi
   
	for file in $( find ${1} ); do
	  [[ -d "$file" ]] && echo "$file is a subdirectory"
	  [[ -f "$file" ]] && echo "$file is a file"
	done
}

# function files_size1 which should list the file sizes
# only for all given files not directories passed 
# as parameters to the function.

file_size1 () {

	for file in $@
	do
		if [ ! -f $file ]; 
		then echo "Error message: $file not a file or doesn't exist"
		else
			FILESIZE=$(stat -f%z "$file")
			echo "Size of $file = $FILESIZE bytes."
		fi
	done
}

# function files_size2 which should list the file sizes
# for all given files incliding directories passed 
# as parameters to the function.


file_size2 () {

	for file in $@
	do
		if [ ! -e $file ]; then 
			echo "Error message: $file doesn't exist"
		elif [ -f $file ]; then
			file_size=$(stat -f%z "$file")
			echo "$file is a file and its size = $file_size bytes."
		elif [ -d $file ]; then
			file_size=$(stat -f%z "$file")
			echo "$file is a directory and its size = $file_size bytes."
		fi
	done
}


# Testing first function list_all_files with different directories

echo "Files and subdirectories in /dir1/dir1a"
list_all_files /dir1/dir1a
echo "______________________________________"

echo "Files and subdirectories in files.txt"
list_all_files files.txt
echo "_______________________________________"

echo " Files and subdirectories in /Users/irinagolovko/lab "
list_all_files /Users/irinagolovko/lab
echo "__________________________________________________"

echo "Files and subdirectories in Users/irinagolovko/Documents/Unix"
list_all_files /Users/irinagolovko/Documents/Unix


# Testing function file_size1 with different parameters
echo "______________________________________________"
echo "Testing function file_size1"

file_size1 /Users/irinagolovko/Desktop/java_exer.docx 

file_size1 /Users/irinagolovko/Desktop/Workspace /Users/irinagolovko/Desktop/numbers /Users/irinagolovko/lab/hw4_2.sh


echo "______________________________________________"
echo "Testing function file_size2"

file_size2 /Users/irinagolovko/Desktop/java_exer.docx 

file_size2 /Users/irinagolovko/Desktop/Workspace /Users/irinagolovko/Desktop/numbers /Users/irinagolovko/lab/hw4_2.sh



