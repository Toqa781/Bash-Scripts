#!/bin/bash

# Variables Declaration
PACKAGE="wget unzip apache2"
SVC="apache2"
TMPDIR="/tmp/webfiles"
#URL="https://www.tooplate.com/zip-templates/2147_titan_folio.zip"
#ART_NAME="2147_titan_folio"

#Insatll Dependinces
echo "##############################"
echo "INSTALL DEPENDINCES"
echo "##############################"
sudo apt install $PACKAGE > /dev/null

#start and enable services
echo "##############################"
echo "START AND ENABLE SERVICE"
echo "##############################"
sudo systemctl start $SVC
sudo systemctl enable $SVC


# Creating a temp directory
echo "##############################"
echo "Creating a temp directory"
echo "##############################"
mkdir -p $TMPDIR
cd $TMPDIR

echo
wget $1 > /dev/null
unzip $2.zip > /dev/null

sudo cp -r $2/* /var/www/html
echo

#Bounce Service
echo "##############################"
echo "Restarting apache2"
echo "##############################"
sudo systemctl restart $SVC
echo

#Clean up
echo "##############################"
echo "Removing temp files"
echo "##############################"
rm -rf $TMPDIR
sudo systemctl status $SVC


