#!/bin/bash

## NOTES: Please respect the rights of the authors and maintainers of the packages and other.
## Please also respect the programmer (me).

# Run as user. (With sudo).

# cd to /home/$USER/tmp
mkdir -p ~/tmp
cd ~/tmp

# Create directories for storing configs and other.
mkdir -p ~/.fonts ~/.icons ~/.themes ~/.config/i3
touch ~/.config/i3/config
touch ~/.config/i3/i3blocks.conf
mkdir -p ~/Documents/Programming/C ~/Documents/Programming/C++ ~/Documents/Programming/C# ~/Documents/Programming/Java ~/Documents/Programming/www ~/Documents/Programming/Perl ~/Documents/Programming/Python ~/Documents/Programming/Ruby ~/Documents/Programming/Shell

# Fetch files from my personal online repo.

if curl --fail -X POST -d@myfile.txt server-URL; then
    # …(success)
else
    # …(failure)
fi;

curl 0.0.0.0(insert real ip here)/repo/goodies/fonts/Raleway.zip -o Raleway.zip
curl 0.0.0.0(insert real ip here)/repo/goodies/fonts/fontawesome.zip -o fontawesome.zip
curl 0.0.0.0(insert real ip here)/repo/goodies/Wallpapers.zip -o Wallpapers.zip

# Exit if the server doesn't exist.
if error
  then
    fi

# Install RPMFusion.
su -c 'dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

# Update system.
sudo dnf -y update

# Clean system.
sudo dnf -y clean all

# Install LOTS of packages.
sudo dnf -y vim gcc-c++ feh i3 screenfetch vlc chromium gimp transmission liberation-fonts-common p7zip p7zip-plguins links ranger w3m vulkan vdpauinfo libva-vdpau-driver libva-utils

# One last clean, I swear!
dnf -y clean all
