#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# Install nala for better apt ui
#sudo apt install nala

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput xorg-dev light xsettingsd

# Python installed for bumblebee-status. PACKAGE INCLUDES build-essential.
sudo apt install -y python3-pip 

# Microcode for Intel/AMD 
# sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode 

# Network Manager
sudo apt install -y network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome

# Installation for Appearance management
sudo apt install -y lxappearance 

# File Manager (eg. pcmanfm,krusader)
sudo apt install -y thunar xfce4-settings xfce4-power-manager

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends wget

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Terminal (eg. terminator,kitty,xfce4-terminal,tilix)
sudo apt install -y kitty

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
sudo apt install -y neofetch btop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
#sudo apt install -y exa

# Printing and bluetooth (if needed)
#sudo apt install -y cups
#sudo apt install -y bluez blueman

#sudo systemctl enable bluetooth
#sudo systemctl enable cups

# Browser Installation (eg. chromium)
#sudo apt install -y firefox-esr 

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart.sh for i3-gaps
sudo apt install -y nitrogen 
#sudo apt install -y feh

# Install i3 gaps and bar
sudo apt install -y i3

# Packages needed i3-gaps after installation
sudo apt install -y dmenu sxhkd numlockx rofi dunst libnotify-bin picom unzip geany simple-scan polybar xclip maim gtk2-engines-pixbuf gtk2-engines-murrine xdotool

# Command line text editor -- nano preinstalled  -- I like micro but vim is great
#sudo apt install -y micro
# sudo apt install -y neovim

# Install fonts
sudo apt install -y fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus
#fonts-cascadia-code

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Music player
sudo apt install -y mpd ncmpcpp ffmpeg mpc jq

# Dependencies for Ly Console Manager
sudo apt install -y libpam0g-dev libxcb-xkb-dev git

# Install Ly Console Display Manager
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service
cd ..

# Lightdm can be used instead of Ly (more common)
# comment out all ly console display if choosing lightdm
# sudo apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
# sudo systemctl enable lightdm

## These two scripts will install nerdfonts and copy my configuration files into the ~/.config directory
## Configuration uses 

# Install GTK Themes
git clone https://github.com/wildan-pratama/archcraft-themes.git
cd archcraft-themes
./install.sh
cd ..

# Install Icon Themes
git git clone https://github.com/wildan-pratama/archcraft-icons.git
cd archcraft-icons
./install.sh
cd ..

# Download backgrunds
git git clone https://github.com/wildan-pratama/archcraft-wallpapers.git
cd archcraft-wallpapers
./install.sh
cd ..

# Install Network Manager dmenu
sudo apt install -y python3-gi python3-gi-cairo gir1.2-gtk-4.0 libnm-dev
mkdir -p $HOME/.local/bin/
git clone https://github.com/firecat53/networkmanager-dmenu.git
cp ./networkmanager-dmenu/networkmanager_dmenu $HOME/.local/bin/
chmod +x $HOME/.local/bin/networkmanager_dmenu


./copyconf.sh
./nerdfonts.sh

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
