#!/bin/bash
# Irina Golovko
# Hw# 7 alias_function_library for assignment # 7

output_extension () {
		extension=$(echo $filename | cut -f 2 -d '.')
		echo "Extension of the given filename $filename is: $extension"
}


output_baseName () {
	fullfilename="$1"
	filename=$(basename "$fullfilename")
	base_Name=${filename%.*}
	echo "Filename without Path: $filename"
	echo "Base_Name of the given filename $filename is: $base_Name"	
}


setval() {
	local  __resultvar=$1
   	local  myresult=1000
   	eval $__resultvar="'$myresult'"    
}

clean_up () {
	echo "Congratulations!!!"
	echo "You are cleaning things up"
} 


alias dirW='echo Working directory is $PWD'

alias ll='ls -l $dir'

alias l='dirW | ll'

alias setthat='setval that'

