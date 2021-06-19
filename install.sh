#! /bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "Set Hostname"
hostnamectl set-hostname linux

echo "Enable RPMFusion" 
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Install Flatpak"
sudo dnf install -y flatpak
echo "Enable Flathub remote"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Install Packages"
sudo dnf -y install sway \
	swaylock \
	swayidle \
	waybar \
	wofi \
	alacritty \
	slurp \
	grim \
	swappy \
	zsh \
	util-linux-user \
	bat \
	lsd \
	yubioath-desktop \
	firefox \
	mako \
	pavucontrol \
	tmux \
	fzf \
	htop \
	vlc  \
	mpv \
	chromium \
	thunderbird

flatpak install -y  flathub com.spotify.Client \
	com.discordapp.Discord \
	com.github.PintaProject.Pinta \
	com.github.wwmm.pulseeffects

# wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

echo "Install OhMyZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


echo "Make zsh default shell"
chsh $(which zsh)

echo "Create alias"
# nvim bat lsd

echo "Install VSCODE"

sudo -y rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf -y install code

echo "Install VirtualBox"
sudo dnf install -y VirtualBox kernel-devel-$(uname -r) akmod-VirtualBox
akmods

echo "Create Folders" 
mkdir -p ~/temp ~/scripts ~/repos ~/projects ~/apps

echo "Install NerdFonts" 

if [ ! -d ~/temp/nerd-fonts]
then
	git clone https://github.com/ryanoasis/nerd-fonts.git temp/
	cd ~/temp/nerd-fonts
	./install.sh
	cd
else
	echo "NerdFonts already installed"

echo "Mkdir dotfiles folders" 
mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/wofi

echo "cp dotfiles" 
cp .config/sway/config ~/.config/sway/config
cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp .config/waybar/config ~/.config/waybar/config
cp .config/wofi/config ~/.config/wofi/config

echo "Install Finished. Please Reboot and select swaywm".

