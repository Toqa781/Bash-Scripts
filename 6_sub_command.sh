#!/bin/bash
##
FREE_RAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=`uptime | awk '{print $9}'`
ROOTFREE=$(df -h | grep '/dev/sdd' | awk '{print $4}')

echo "####################################"
echo " Available free RAM is $FREE_RAM mb"
echo "####################################"
echo "Current Load Average $LOAD"
echo "####################################"
echo "Free Root partition size: $ROOTFREE"

