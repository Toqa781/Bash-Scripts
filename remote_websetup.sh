#!/bin/bash
#
USR="devops"
for host in `cat remhosts`
do
	echo "#################################"
	echo "connecting to $host"
	echo "Pushing script to $host"
	scp 16_mutlios_websetup.sh $USR@$host:/tmp/
	echo "executing the script on $host"
	ssh $USR@$host /tmp/16_mutlios_websetup.sh
	echo "#################################"
done
