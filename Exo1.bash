#!/bin/bash

echo $#
emptyArgs () {
    if test "$1" -eq 0
    then 
        echo "No arguments exiting with code 2..."
        exit 2
    fi
}
verifFile () {
    if test -e "$1"
    then 
        echo "La source '$1' existe bien"
    else
        echo "La source '$1' n'existe pas"
    fi
}

emptyArgs "$#"
echo "Verification des arguments :"
for FILE in "$@"
do verifFile "$FILE"
done