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
makepkg -si --noconfirm
cd ~
yay -Syy

# Massengers: telegram, slack
sudo pacman -S telegram-desktop --noconfirm
yay -Syy
yay -S slack-desktop --noconfirm

# Import wallpapers
git clone https://github.com/imnetcat/wallpapers

# Enable tilling KDE mode
git clone https://github.com/faho/kwin-tiling.git
cd kwin-tiling
plasmapkg2 --type kwinscript -i .
kcmshell5 kwinscripts
cd ~

# Import configs
dconf load / < ../appearance/dconf
mkdir ~/.config/terminator
cp ../appearance/terminator ~/.config/terminator/config
cp ../appearance/btcprice.sh ~
