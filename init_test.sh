#!/bin/bash

sed -i "s/\(\"\)$/\ G4\"/g" lab.conf
echo " " >> lab.conf
echo "G4[0]=ex" >> lab.conf
echo "G4[mem]=128" >> lab.conf

echo "ifconfig eth0 172.0.0.14" >> G4.startup
echo "route add default gw 172.0.0.254" >> G4.startup
echo "/etc/init.d/ssh start" >> G4.startup
echo "/etc/init.d/apache2 start" >> G4.startup

mkdir G4
mkdir G4/etc
mkdir G4/var

exit

