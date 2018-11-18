#!/bin/bash
# Irina Golovko
# Hw# 4 task 1

# check it’s a file or directory, if a file – write a filename
# to files.txt, if a directory – to dirs.txt

function traverse() {
    for file in $(ls "$1")
    do
        #current=${1}{$file}
        if [[ ! -d ${1}/${file} ]]; then
            echo " ${1}/${file} is a file and will be save to files.list"
            echo ${1}/${file} >>files.list
		elif [[ -d ${1}/${file} ]]; then
             echo "${1}/${file} is a subdirectory and will be save to dirs.list"
             echo ${1}/${file} >>dirs.list

        else
            #echo "entering recursion with: ${1}${file}"
            traverse "${1}/${file}"
        fi
	done
	}



echo -n "Please Enter a file name or directory name: >"
read filename

if [ -f $filename ]; then
   echo "$filename will be saved to files.txt."
   echo $filename 1>>files.txt

elif [ -d $filename ]; then
    echo "$filename will be saved to dirs.txt. "
	echo $filename 1>>dirs.txt
else
     echo "Bad file" >&2
fi


for arg in "$@"; do
  shift
  case "$arg" in
    "--files-list") set -- "$@" "-f" ;;
    "-d") set -- "$@" "-d" ;;
    *)        set -- "$@" "$arg"
  esac
done


# Parse short options
OPTIND=1
while getopts "fd" opt
do
  case "$opt" in
      "f")
    		echo "We change name of file.txt to files.list because of option --files-list"
    		mv files.txt files.list >&2;
# if we put here dir=$2 it would read only arguments following by options
                ;; 

        "d")
                echo "Now we change name of dirs.txt to dirs.list because of option -d"
                mv dirs.txt dirs.list >&2;
                        ;;

 esac
done

traverse $dir

shift $(expr $OPTIND - 1) # remove options from positional parameters



function main() {
    traverse "$1"
}

main "$1"

