#!/bin/bash

#This script allows you to reset the lab

rm G4.startup
rm G4.disk
rm G4.ready
rm G0.disk
rm G0.ready
rm -r G4
rm lab.conf

echo 'machines="G0"' >> lab.conf
echo ' ' >> lab.conf
echo 'G0[0]=tap,10.0.0.1,10.0.0.2' >> lab.conf
echo 'G0[1]=ex' >> lab.conf
echo 'G0[mem]=128' >> lab.conf
