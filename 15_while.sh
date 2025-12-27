#!/bin/bash
#
count=0
while [ $count -lt 5 ]
do
	echo "Looping.."
	echo "The value of count is $count"
	count=$(( $count+1 ))
	sleep 1
done

