#!/bin/bash

#This script creates all the stuff needed to load G4
#Lines that have to be modified for real use:
#>> echo "G4[0]=ex" -> replace "ex"
#>> lstart G0 G4 -> delete G0

#Modify lab.conf
sed -i "s/\(\"\)$/\ G4\"/g" lab.conf
echo " " >> lab.conf
echo "G4[0]=ex" >> lab.conf
echo "G4[mem]=256" >> lab.conf

#Create G4.startup
echo "ifconfig eth0 172.0.0.14" >> G4.startup
echo "route add default gw 172.0.0.254" >> G4.startup
echo "/etc/init.d/ssh start" >> G4.startup
echo "/etc/init.d/apache2 start" >> G4.startup
echo "/etc/init.d/bind start" >> G4.startup

#Add needed folders
mkdir -p G4/etc/ssh
mkdir -p G4/var

#Set up ssh
cp G0/etc/ssh/sshd_config G4/etc/ssh
sed -i "s/Port 1022/Port 1422/g" G4/etc/ssh/sshd_config

#Set up DNS
echo 'nameserver 8.8.8.8' >> G4/etc/resolv.conf

#Start the lab
lstart G0 G4

exit
