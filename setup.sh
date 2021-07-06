#Update && Upgrade
sudo pacman -Syyu --noconfirm

# Utils
sudo pacman -S curl git base-devel --noconfirm

# Nodejs & npm
sudo pacman -S nodejs npm --noconfirm

# Terminator terminal emulator
sudo pacman -S terminator --noconfirm

# Text editor: NeoVim, Visual Studio Code
sudo pacman -S nvim code

# Docker
sudo pacman -S docker

# VirtualBox for WM
sudo pacman -S virtualbox

# AUR package manager: yay
sudo git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Import configs
dconf load / < ../appearance/dconf
mkdir ~/.config/terminator
cp ../appearance/terminator ~/.config/terminator/config
cp ../appearance/btcprice.sh ~
