#!/bin/zsh
# Script to provision a domain on this server
echo "Welcome to the Domain Provisioning script."
if [ $(id -u) -eq 0 ]; then
	echo -n "What is the name of your domain to provision? (example.com) : "
	read domain
	mkdir /var/www/html/$domain
	cp /etc/apache2/sites-available/blank /etc/apache2/sites-available/$domain	
	vi /etc/apache2/sites-available/$domain
	ln -s /etc/apache2/sites-available/$domain /etc/apache2/sites-enabled/$domain
	echo "Your domain has been provisioned."
	exit 1
else
	echo "Only root may provision domains."
	exit 2
fi
	
