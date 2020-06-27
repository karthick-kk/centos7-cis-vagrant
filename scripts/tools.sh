#!/bin/sh

set -e
set -x

sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install wget perl gcc dkms kernel-devel-`uname -r` kernel-headers-`uname -r` make bzip2 -y
wget https://download.virtualbox.org/virtualbox/LATEST.TXT 
curver=`cat LATEST.TXT|xargs`
wget https://download.virtualbox.org/virtualbox/$curver/VBoxGuestAdditions_$curver.iso

if systemctl list-unit-files | grep -q dkms.service; then
  sudo systemctl start dkms
  sudo systemctl enable dkms
fi

sudo mkdir -p /media/dvd
sudo mount -o loop VBoxGuestAdditions*.iso /media/dvd
sudo sh /media/dvd/VBoxLinuxAdditions.run --nox11
sudo umount /media/dvd
sudo rm -f VBoxGuestAdditions*.iso
sudo rm -f LATEST.TXT
sudo yum clean all
