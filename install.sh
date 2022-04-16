#! /bin/bash
# Setup for a new Fedora Machine
echo "Set Hostname"
hostnamectl set-hostname linux

echo "Enable RPMFusion"
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \ 
	   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Install Flatpak"
sudo dnf install -y flatpak
echo "Enable Flathub remote"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Install Packages"
sudo dnf -y install  \
	yubioath-desktop \
	firefox \
	fzf \
	htop \
	vlc  \
	mpv \
	thunderbird \
	neovim \

echo "Create Folders"
mkdir -p ~/temp ~/scripts ~/repos ~/projects ~/apps
mkdir -p ~/.local/share/nvim/backup
mkdir -p ~/.config/nvim

echo "dotfiles"
cp .config/nvim/* ~/.config/nvim/

echo "Install Finished. Please Reboot"

