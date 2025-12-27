#!/bin/bash
#
value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
then
	echo "1 Active network interface found."
elif [ $value -gt 1 ]
then
	echo "Multiple active network interface found."
else
	echo "No active interface found."
fi
