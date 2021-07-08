
# Import dconf
dconf load / < ~/dev-system-setup/appearance/dconf

# Import terminator conf
mkdir ~/.config/terminator
cp ~/dev-system-setup/appearance/terminator ~/.config/terminator/config
cp ~/dev-system-setup/appearance/btcprice.sh ~
chmod +x ~/btcprice.sh

# Import nvim config
mkdir ~/.config/nvim
cp ~/dev-system-setup/appearance/init.vim ~/.config/nvim/init.vim

# Install nvim plugins
nvim +PlugInstall +qall

# Add aliases
echo "alias v='nvim'" > ~/.bash_aliases
echo "alias vim='nvim'" >> ~/.bash_aliases
source ~/.bash_aliases
