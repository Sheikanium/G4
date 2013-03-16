#!/bin/bash

#This script allows you to reset the lab

rm G4.startup
rm G4.disk
rm G0.disk
rm G0.ready
rm -r G4
rm lab.conf

echo 'machines="G0"' >> lab.conf
echo ' ' >> lab.conf
echo 'G0[0]=ex' >> lab.conf
echo 'G0[mem]=128' >> lab.conf
