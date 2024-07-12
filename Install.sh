##################
# Install script #
##################

################
# NVIDIA STUFF #
################

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