#!/bin/bash

function show_usage (){
    printf "Usage: $0 [options [parameters]]\n"
    printf "\n"
    printf "Options:\n"
    printf " -c|--copy, Copy your file to /tmp/script\n"
    printf " -d|--delete, Delete your file\n"
    printf " -r|--read, Read your file\n"

return 0
}

verifFile () {
    if test ! -e "$1"
    then
        echo "La source '$1' n'existe pas"
		exit 2
    fi
}

verifFile "$1"

case $2 in
     --copy|-c)
         shift
		 cp $1 /tmp/script
         shift
         ;;
     --delte|-d)
         shift
		 rm $1
         ;;
     --read|-r)
        shift
		cat $1
         ;;
     *)
        echo "Incorrect input provided"
        show_usage
        ;;
esac