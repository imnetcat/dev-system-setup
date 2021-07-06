#Update && Upgrade
sudo pacman -Syyu --noconfirm

# Utils
sudo pacman -S curl git base-devel --noconfirm

# Nodejs & npm
sudo pacman -S nodejs npm --noconfirm

# Terminator terminal emulator
sudo pacman -S terminator --noconfirm

# Text editor: NeoVim, Visual Studio Code
sudo pacman -S nvim code --noconfirm

# Docker
sudo pacman -S docker --noconfirm

# VirtualBox for WM
sudo pacman -S virtualbox --noconfirm

# AUR package manager: yay
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R  imnetcat:users yay
cd yay
makepkg -si

# Massengers: telegram, slack
sudo pacman -S telegram-desktop --noconfirm
yay -S slack-desktop --noconfirm

# Import configs
dconf load / < ../appearance/dconf
mkdir ~/.config/terminator
cp ../appearance/terminator ~/.config/terminator/config
cp ../appearance/btcprice.sh ~
