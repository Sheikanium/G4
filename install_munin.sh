#!/bin/bash

#Install Munin, a monitoring solution
INSTALLER_LOG=/var/log/my-installer.log

apt-get update

installnoninteractive(){
  sudo bash -c "DEBIAN_FRONTEND=noninteractive aptitude install -q -y $* >> $IN$
}

installnoninteractive munin
installnoninteractive munin-node

#include default dir for website
line=8

while test "$line" != 12
        do sed -i "$line s/\#/ /g" /etc/munin/munin.conf
        line=$(($line + 1))
done


sed-i "18s/\#//g" /etc/munin/munin.conf

#Modify localhost
sed -i "60s/^/\#/g"
sed -i "61s/^/\#/g"
sed -i "62s/^/\#/g"

######

sed -i "1s/$/\ localhost\.localdomain/g" /etc/hosts
sed -i "3a 172\.0\.0\.14 g4\.sio\.org/g" /etc/hosts

#Munin node configuration
sed -i "29s/^.*/host_name g4.sio.org/g" /etc/munin/munin-node.conf
sed -i "36a allow \^172\\\.0\\\.0\\\.14\$" /etc/munin/munin-node.conf
sed -i "37a alow \^172\\\.31\\\.52\\\.14\$" /etc/munin/munin-node.conf

sed -i "4s/Allow/\#Allow" /etc/apache2/conf.d/munin
sed -i "4a Allow from all" /etc/apache2/conf.d/munin

/etc/init.d/apache2 restart
