#!/bin/bash

sed -i "25s/^/\#/g" /etc/apt/sources.list
sed -i "19s/\#//g" /etc/apt/sources.list
sed -i "19s/unstable/stable/g" /etc/apt/sources.list

INSTALLER_LOG=/var/log/my-installer.log

apt-get update

installnoninteractive(){
  sudo bash -c "DEBIAN_FRONTEND=noninteractive aptitude install -q -y $* >> $INSTALLER_LOG"
}

installnoninteractive debian-archive-keyring
apt-get update
