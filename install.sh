#!/bin/bash

installnoninteractive(){
  bash -c "DEBIAN_FRONTEND=noninteractive aptitude install -q -y $*"
}

#install needed software
installnoninteractive apache2
installnoninteractive mysql-server
installnoninteractive php5

#Apache2 configuration

#Modifying listenning port
sed -i "9s/80/1480/g" /etc/apache2/ports.conf

#Activating Apache2 userdir
a2enmod userdir

sed -i "6s/Allow.*/AllowOverride\ All/g" /etc/apache2/mods-available/userdir.conf

#Php5 configuration
line=11
while [ $line -le 15 ]
do
	sed -i "${line}s/^/#/" /etc/apache2/mods-available/php5.conf
	(( line++ ))
done

#Port forwading on 1480
sed -i "1s/80/1480/g" /etc/apache2/sites-available/default

#Restarting apache2
/etc/init.d/apache2 restart

#Creating log file for php
touch phpinfo.php
echo "<?php phpinfo(); ?>" >> phpinfo.php
