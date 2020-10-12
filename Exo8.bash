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

verifGroup () {
	#1 --> Group exists
	#0 --> Group doesn't exists
	cut -f1 -d':' ../../../etc/group | grep -w "$1"
	if [ $? -eq 0 ] ; then
		return 1
	else
		return 0
	fi
}

verifUser () {
	#1 --> User exists
	#0 --> User doesn't exists
	cut -f1 -d':' ../../../etc/passwd | grep -w "$1"
	if [ $? -eq 0 ] ; then
		return 1
	else
		return 0
	fi
}

while [ -z $file_name -o $? -eq 1 ] ; do 
	echo "Enter the filename"
	read file_name
	verifFile $file_name
done

while [ -z $user_name -o $? -eq 0 ] ; do 
	echo "Enter the new owner username"
	read user_name
	verifUser $user_name
done

while [ -z $group_name -o $? -eq 0 ] ; do 
	echo "Enter the new owner groupname"
	read group_name
	verifGroup $group_name
done

sudo chown $user_name:$group_name $file_name