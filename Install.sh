#!/bin/bash

clear

title() {
echo -e "  ___  ___                 ______      _         "
echo -e "  |  \/  |                 |  _  \    | |        "
echo -e "  | .  . | __ _ _ __   __ _| | | |___ | |_ ___   "
echo -e "  | |\/| |/ _` | '_ \ / _` | | | / _ \| __/ __|  "
echo -e " _| |  | | (_| | | | | (_| | |/ / (_) | |_\__ \  "
echo -e "(_)_|  |_/\__,_|_| |_|\__,_|___/ \___/ \__|___/  "
}                                             

title

echo "Updating kernel with nvidia modules..."
echo ""

# edit mkinitcpio.conf
sudo nano /etc/mkinitcpio.conf

# add below value to modules section
MODULES=(nvidia nivida_modeset nvidia_uvm nvidia_drm)

# create nvidia.conf
sudo nano /etc/modprobe.d/nvidia.conf

# add to nvidia.conf
options nvidia_drm modeset=1 fbdev=1

# recompile kernel with nvidia stuff
sudo mkinitcpio -P

# reboot
sudo reboot now

# change default shell
chsh -s /usr/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# extra apps
aylurs-gtk-shell
brightnessctl

# copy .zsh config
cp .zsh ~/

# Install Paru
sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

# Copy .face.icon to root
cp .face.icon ~/