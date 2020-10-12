#!/bin/bash

verifUser () {
	#1 --> User exists
	#0 --> User doesn't exists
	cut -f1 -d':' ../../../etc/passwd | grep -w "$1"
	if [ $? -eq 0 ] ; then
		echo "L'utilisateur $1 existe"
		return 1
	else
		return 0
	fi
}

choice=0
# Main display
echo "Enter number to select an option"
echo
echo "1) Add a User"
echo "2) Delete a User"
echo

while [ $choice -eq 0 ]; do

	read choice

	if [ $choice -eq 1 ] ; then    

		echo -e "Enter Username"
		read user_name
		verifUser $user_name
		if [ $? -eq 1 -o -z $user_name ] ; then
			echo "Operation cancelled"
			exit 1
		fi
		echo -e "Enter Password"
		read user_passwd
		sudo useradd $user_name -m -p $user_passwd
		cat  /etc/passwd 
		
	elif [ $choice -eq 2 ] ; then
		echo -e "User to be deleted:"
		read del_user
		verifUser $del_user
		if [ $? -eq 0 -o -z $del_user ] ; then
			echo "Operation cancelled"
			exit 1
		fi
		sudo userdel -r $del_user
		cat  /etc/passwd
		echo
	else 
		echo "Option invilade"
	fi
done
