#!/bin/bash

sed -i "25s/^/\#/g" /etc/apt/sources.list
sed -i "19s/\#//g" /etc/apt/sources.list
sed -i "19s/unstable/stable/g" /etc/apt/sources.list

INSTALLER_LOG=/var/log/my-installer.log

apt-get update

gpg --keyserver pgp.mit.edu --recv-keys AED4B06F473041FA
gpg --armor --export AED4B06F473041FA| apt-key add -

apt-get update
