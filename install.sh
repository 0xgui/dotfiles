#! /bin/bash
# Setup for a new Fedora Machine
echo "Set Hostname"
hostnamectl set-hostname linux

echo "Enable RPMFusion"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Install Flatpak"
sudo dnf install -y flatpak
echo "Enable Flathub remote"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Install Packages"
sudo dnf -y install  \
	yubioath-desktop \
	firefox \
	fzf \
	bpytop \
	mpv \
	thunderbird \
	neovim \
	util-linux \
	sway waybar swayidle swaybg wob \
	blueman \
	wdisplays \
	wofi \
	wlogout \
	dnf-plugins-core \
	mako \
	alacritty \
	libappindicator \
	hstr \
	ripgrep \
	gvfs-smb \
  cifs-utils \
	zathura \
	zathura-pdf-poppler \
	grim swappy \
	udiskie

echo "Create Folders"
mkdir -p ~/temp ~/projects 
mkdir -p ~/.local/share/nvim/backup
mkdir -p ~/.config/nvim
mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar
mkdir -p ~/.config/wofi
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/mako
mkdir -p ~/.config/zathura

echo "dotfiles"
cp -r .config/nvim/* ~/.config/nvim/
cp -r .config/sway/* ~/.config/sway/
cp -r .config/waybar/* ~/.config/waybar/
cp -r .config/wofi/* ~/.config/wofi/
cp -r .config/alacritty/* ~/.config/alacritty/
cp -r .config/mako/* ~/.config/mako/
cp -r .config/zathura/* ~/.config/zathura/

echo "Install Finished. Please Reboot"

