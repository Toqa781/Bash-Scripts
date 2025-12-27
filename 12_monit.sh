#!/bin/bash
#
file="/var/run/apache2/apache2.pid"

if [ -f $file ]
then
	echo "###################################"
	echo "httpd/apache2 process is running"
	echo "###################################"
else
	echo "###################################"
	echo "httpd/apache2 process is NOT running"
	echo "###################################"
	echo
	echo "Start the process.."
	systemctl start apache2
	if [ -f $file ]
	then
		echo "Process started successfully."
	else
		echo "Process failed to start, contact the admin"
	fi
fi
