#!/bin/bash

sed -i "s/\(\"\)$/\ G4\"/g" lab.conf
echo " " >> lab.conf
echo "G4[0]=ex" >> lab.conf
echo "G4[mem]=256" >> lab.conf

echo "ifconfig eth0 172.0.0.14" >> G4.startup
echo "route add default gw 172.0.0.254" >> G4.startup
echo "/etc/init.d/ssh start" >> G4.startup
echo "/etc/init.d/proftpd" >> G4.startup
echo "/etc/init.d/apache2 start" >> G4.startup

mkdir -p G4/etc/ssh
mkdir G4/var

cp G0/etc/ssh/sshd_config G4/etc/ssh/
sed -i "s/\(22\)$/1422/g" G4/etc/ssh/sshd_config


exit
