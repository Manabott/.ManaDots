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

echo "Installing .ManaDots..."

# Update mkinitcpio.conf
sudo sed -i 's/^MODULES=.*/MODULES=(btrfs nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf

# Create nvidia.conf
echo "options nvidia_drm modeset=1 fbdev=1" | sudo tee /etc/modprobe.d/nvidia.conf

# Recompile kernel
sudo mkinitcpio -P

# Change default shell to zsh
chsh -s /usr/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

# Install dependencies
paru -S git nano kitty nemo spotify grimblast swappy firefox brave swww swaylock aylurs-gtk-shell zsh neovim fastfetch gvfs gnome-bluetooth-3.0 pipewire-pulse NetworkManager nwg-look timeshift dunst cava waybar rofi hyprland-git vscode transmission ranger ttf-material-icons-git ttf-iosevka ttf-jetbrains-mono-git brightnessctl qt5ct qt6ct gruvbox-plus-icon-theme-git upscaler gimp cliphist pamixer


# Copy dotfiles
cp -r .config ~/
cp .zshrc ~/
cp .face.icon ~/

# Install additional configurations
cp mkinitcpio.conf /etc/mkinitcpio.conf

echo "Installation complete. Please restart your system."
