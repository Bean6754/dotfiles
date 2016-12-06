#!/bin/ksh

if [ "$(id -u)" != "0" ]; then
  echo -e "\033[COLORm Sample text"
   echo "You are running as user."
   whoami
else
  echo "ERROR!"
  echo "You are running as root."
   exit 1
fi

echo "export PS1='$(logname)@$(hostname -s):$PWD $ '" >> ~/.profile

mkdir -p ~/tmp
cd ~/tmp

# Create directories for storing configs and other.
mkdir -p ~/.fonts ~/.icons ~/.themes ~/.config/i3
touch ~/.config/i3/config
touch ~/.config/i3/i3blocks.conf
mkdir -p ~/Documents/Programming/C ~/Documents/Programming/C++ ~/Documents/Programming/C# ~/Documents/Programming/Java ~/Documents/Programming/www ~/Documents/Programming/Perl ~/Documents/Programming/Python ~/Documents/Programming/Ruby ~/Documents/Programming/Shell



su -c 'pkg_add -v vim sudo i3 git wget curl bash chromium'
chsh -s /usr/local/bin/bash

echo 'exec i3' > .xinitrc
echo 'startx' >> .bash_rc
