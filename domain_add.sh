#!/bin/zsh
# Script to provision a domain on this server
echo "Welcome to the Domain Provisioning script."
if [ $(id -u) -eq 0 ]; then
	echo -n "What is the name of your domain to provision? (example.com) : "
	read domain
	mkdir /var/www/html/$domain	
	touch /etc/apache2/sites-available/$domain
	touch /var/www/log/$domain-access.log
	touch /var/www/log/$domain-error.log
	echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$domain
	echo "	ServerName $domain" >> /etc/apache2/sites-available/$domain
	echo "	ServerAlias www.$domain" >> /etc/apache2/sites-available/$domain
	echo "	DocumentRoot /var/www/html/$domain" >> /etc/apache2/sites-available/$domain
	echo "	CustomLog /var/www/log/$domain-access.log combined" >> /etc/apache2/sites-available/$domain
	echo "	ErrorLog /var/www/log/$domain-error.log" >> /etc/apache2/sites-available/$domain
	echo "</VirtualHost>" >> /etc/apache2/sites-available/$domain
	ln -s /etc/apache2/sites-available/$domain /etc/apache2/sites-enabled/$domain
	echo "Your domain has been provisioned. Please verify in /var/www/html"
	echo "and /etc/apache2/sites-enabled/."
	exit 1
else
	echo "Only root may provision domains."
	exit 2
fi
	
