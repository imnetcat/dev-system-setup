#Update && Upgrade
sudo pacman -Syyu --noconfirm

# Utils
sudo pacman -S \
  curl \
  git \
  base-devel \
  neofetch \
  htop \
  --noconfirm

# Terminator terminal emulator
sudo pacman -S terminator --noconfirm

# Text editor: NeoVim, Visual Studio Code
sudo pacman -S neovim code --noconfirm

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

# Massengers: telegram, discord
sudo pacman -S telegram-desktop discord --noconfirm

# Import wallpapers
git clone https://github.com/imnetcat/wallpapers

# Enable tilling KDE mode
git clone https://github.com/faho/kwin-tiling.git
cd kwin-tiling
plasmapkg2 --type kwinscript -i .
kcmshell5 kwinscripts
cd ~

# Nodejs 14 & npm 7
yay -S nvm --noconfirm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
exec $SHELL
nvm install 14
npm i -g npm@7

# Import configs
dconf load / < ~/dev-system-setup/appearance/dconf
mkdir ~/.config/terminator
cp ~/dev-system-setup/appearance/terminator ~/.config/terminator/config
cp ~/dev-system-setup/appearance/btcprice.sh ~
chmod +x ~/btcprice.sh
