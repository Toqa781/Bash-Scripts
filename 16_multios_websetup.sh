#!/bin/bash

# Variables Declaration
PACKAGE="wget unzip apache2"
#SVC="apache2"
TMPDIR="/tmp/webfiles"
URL="https://www.tooplate.com/zip-templates/2147_titan_folio.zip"
ART_NAME="2147_titan_folio"
VIRUS="COVID19"

yum --help

if [ $? -eq 0]
then
	SVC="httpd"
	#Insatll Dependinces
	echo "##############################"
	echo "INSTALL DEPENDINCES"
	echo "##############################"
	sudo yum install $PACKAGE -y > /dev/null

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
	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null

	sudo cp -r $ART_NAME/* /var/www/html
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
else

	SVC="apache2"

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
	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null

	sudo cp -r $ART_NAME/* /var/www/html
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
fi

echo "##############################"
echo "Quotes"
echo "##############################"
echo "Due to $VIRUS virus, the company has lost \$9 million"
