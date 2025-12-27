#!/bin/bash


#Insatll Dependinces
echo "##############################"
echo "INSTALL DEPENDINCES"
echo "##############################"
sudo apt install wget unzip apache2 > /dev/null

#start and enable services
echo "##############################"
echo "START AND ENABLE SERVICE"
echo "##############################"
sudo systemctl start apache2
sudo systemctl enable apache2


# Creating a temp directory
echo "##############################"
echo "Creating a temp directory"
echo "##############################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles

echo
wget https://www.tooplate.com/zip-templates/2147_titan_folio.zip > /dev/null
unzip 2147_titan_folio.zip > /dev/null

sudo cp -r 2147_titan_folio/* /var/www/html
echo

#Bounce Service
echo "##############################"
echo "Restarting apache2"
echo "##############################"
sudo systemctl restart apache2
echo

#Clean up
echo "##############################"
echo "Removing temp files"
echo "##############################"
rm -rf /tmp/webfiles
sudo systemctl status apache2


