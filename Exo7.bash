#!/bin/bash

verifFile () {
	#0 --> File exists
	#1 --> file doesn't exists
	[ -e "$1" ]
	if [ $? -eq 0 ] ; then
		echo "Le fichier $1 existe"
		return 0
	else
		return 1
	fi
}

function show_usage (){
    echo "Enter number to select an option"
	echo
	echo "1) Create a file"
	echo "2) Delete a file"
	echo
return 0
}

choice=0

while [ $choice -eq 0 ]; do

	show_usage
	read choice
	
	case $choice in
		 1)
			 echo "Enter the filename"
			 read file_name
			 if [ -e $file_name ] ; then
				echo "File $file_name already exists"
			 else
				touch $file_name
			 fi
			;;
		 2)
			 echo "Enter the filename"
			 read file_name
			 if [ -e $file_name ] ; then
				rm $file_name
			 else
				echo "File $file_name doesn't exist"
			 fi
			 ;;
		 *)
			echo "Incorrect input provided"
			show_usage
			;;
	esac
	
done