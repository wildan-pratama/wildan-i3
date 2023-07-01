#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# Install nala for better apt ui
sudo apt install nala

# xorg display server installation
sudo nala install -y xorg xbacklight xbindkeys xvkbd xinput xorg-dev

# Python installed for bumblebee-status. PACKAGE INCLUDES build-essential.
sudo nala install -y python3-pip 

# Microcode for Intel/AMD 
# sudo nala install -y amd64-microcode
sudo nala install -y intel-microcode 

# Network Manager
sudo nala install -y network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome

# Installation for Appearance management
sudo nala install -y lxappearance 

# File Manager (eg. pcmanfm,krusader)
sudo nala install -y thunar xfce4-settings xfce4-power-manager xfce4-terminal

# Network File Tools/System Events
sudo nala install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Terminal (eg. terminator,kitty,xfce4-terminal,tilix)
sudo nala install -y kitty

# Sound packages
sudo nala install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
sudo nala install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
#sudo nala install -y exa

# Printing and bluetooth (if needed)
#sudo nala install -y cups
#sudo nala install -y bluez blueman

#sudo systemctl enable bluetooth
#sudo systemctl enable cups

# Browser Installation (eg. chromium)
#sudo nala install -y firefox-esr 

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart.sh for i3-gaps
sudo nala install -y nitrogen 
#sudo nala install -y feh

# Packages needed i3-gaps after installation
sudo nala install -y dmenu sxhkd numlockx rofi dunst libnotify-bin picom unzip geany simple-scan

# Command line text editor -- nano preinstalled  -- I like micro but vim is great
#sudo nala install -y micro
# sudo nala install -y neovim

# Install fonts
sudo nala install fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus -y
#fonts-cascadia-code

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Install i3 gaps
sudo nala install i3 -y

# Dependencies for Ly Console Manager
sudo nala install -y libpam0g-dev libxcb-xkb-dev git

# Install Ly Console Display Manager
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service
cd ..

# Lightdm can be used instead of Ly (more common)
# comment out all ly console display if choosing lightdm
# sudo nala install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
# sudo systemctl enable lightdm

## These two scripts will install nerdfonts and copy my configuration files into the ~/.config directory
## Configuration uses 


./copyconf.sh
./nerdfonts.sh

sudo nala autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
