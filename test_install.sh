#!/bin/bash

#INSTALLER_LOG=/var/log/log_install.log

installnoninteractive(){
  bash -c "DEBIAN_FRONTEND=noninteractive aptitude install -q -y $*"
}

#install needed software
DEBIAN_FRONTEND=noninteractive aptitude install -q -y apache2
DEBIAN_FRONTEND=noninteractive aptitude install -q -y mysql-server
DEBIAN_FRONTEND=noninteractive aptitude install -q -y php5

#Apache2 configuration

#Modifying listenning port
sed -i "9s/80/1480/g" /etc/apache2/ports.conf

#Activating Apache2 userdir
a2enmod userdir

sed -i "6s/Allow.*/AllowOverride\ All/g" /etc/apache2/mods-available/userdir.conf

#Php5 configuration
line=11
while test $line != 15
	do sed -i "$line s//\#/g" /etc/apache2/mods-avaible/php5.conf
	line = $(($line + 1))
done

#Port forwading on 1480
sed -i "1s/80/1480/g" /etc/apache2/sites-available/default

#Restarting apache2
/etc/init.d/apache2 restart

#Creating log file for php
touch phpinfo.php
echo "<?php phpinfo(); ?>" >> phpinfo.php
