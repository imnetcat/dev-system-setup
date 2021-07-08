
# Import dconf
dconf load / < ~/dev-system-setup/appearance/dconf

# Import terminator conf
mkdir ~/.config/terminator
cp ~/dev-system-setup/appearance/terminator ~/.config/terminator/config
cp ~/dev-system-setup/appearance/btcprice.sh ~
chmod +x ~/btcprice.sh

# Import nvim config
cp ~/dev-system-setup/appearance/init.vim /.config/nvim/init.vim
