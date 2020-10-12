#!/bin/bash

verifGroup () {
	#1 --> Group exists
	#0 --> Group doesn't exists
	cut -f1 -d':' ../../../etc/group | grep -w "$1"
	if [ $? -eq 0 ] ; then
		echo "Le groupe $1 existe"
		return 1
	else
		return 0
	fi
}

choice=0
# Main display
echo "Enter number to select an option"
echo
echo "1) Add a Group"
echo "2) Delete a Group"
echo

while [ $choice -eq 0 ]; do

	read choice

	if [ $choice -eq 1 ] ; then    

		echo -e "Enter Groupname"
		read group_name
		verifGroup $group_name
		if [ $? -eq 1 -o -z $group_name ] ; then
			echo "Operation cancelled"
			exit 1
		fi
		sudo groupadd $group_name
		cat  /etc/group 
		
	elif [ $choice -eq 2 ] ; then
		echo -e "Group to be deleted:"
		read del_group
		verifGroup $del_group
		if [ $? -eq 0 -o -z $del_group ] ; then
			echo "Operation cancelled"
			exit 1
		fi
		sudo groupdel $del_group
		cat  /etc/group
		echo
	else 
		echo "Option invilade"
	fi
done
