#!/bin/bash

#Check for root.
#...

cp -r sources.list /etc/apt/sources.list

apt-get update -y
apt-get purge -y file-roller lxterminal firefox abiword gnumeric mplayer
apt-get install -y htop git wget curl vim aptitude i3 i3lock i3status i3blocks fonts-font-awesome fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-liberation lubuntu-restricted-extras lubuntu-restricted-addons vlc p7zip-full unrar rar build-essential libreoffice gimp xarchiver software-properties-gtk steam transmission-gtk transmission-cli default-jdk

clear

echo "NOTE: You will still have to install your specific drivers yourself. (amd64-microcode, intel-microcode, nvidia-driver, etc.."
echo "Launching software-properties-gtk to assist you in driver installation."

software-properties-gtk

echo "All done!"
