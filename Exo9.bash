#!/bin/bash

verifFile () {
	#0 --> File exists
	#1 --> file doesn't exists
	[ -e $1 ]
	if [ $? -eq 0 ] ; then
		return 0
	else
		return 1
	fi
}

file_name=" "
user=" "
group=" "
others=" "

while [ -z $file_name -o $? -eq 1 ] ; do 
	echo "Enter the filename"
	read file_name
	verifFile $file_name
done

while [ -z $user ] ; do 
	echo "Enter the new user rights"
	read user
done

while [ -z $group ] ; do 
	echo "Enter the new group rights"
	read group
done

while [ -z $others ] ; do 
	echo "Enter the new others rights"
	read others
done

sudo chmod "$user$group$others" $file_name