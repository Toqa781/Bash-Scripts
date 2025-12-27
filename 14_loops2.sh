#!/bin/bash
#
MYUSERS="alpha beta gamma"
for usr in $MYUSERS
do
	echo "Adding user $usr"
	adduser $usr
	id $usr
	sleep 1
done
