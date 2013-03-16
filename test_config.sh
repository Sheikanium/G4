#!/bin/bash
INSTALLER_LOG=/var/log/my-installer.log

installnoninteractive(){
  sudo bash -c "DEBIAN_FRONTEND=noninteractive aptitude install -q -y $* >> $INSTALLER_LOG"
}

installnoninteractive debian-archive-keyring
