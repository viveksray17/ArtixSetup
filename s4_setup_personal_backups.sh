#!/bin/bash
sudo mkdir /secrets
sudo mount /dev/sda4 /secrets

directories=(
    ssh
    gnupg
)
for DIR in "${directories[@]}"; do
    dir=~/.$DIR
    if [ -d "$dir" ]; then
        rm -rf "$dir"
    fi
    cp /secrets/vivek/$DIR $dir -r
done
# NVIM SETUP
echo -e "\nINSTALLING vim-plug for neovim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo -e "DONE"

echo -e "\nSetting Up GRUB"
sudo cp /secrets/vivek/files/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo cp /secrets/vivek/fonts/* /usr/share/fonts/ -R
sudo fc-cache -fv

echo -e "\nCOPYING ICONS SO MAY TAKE SOME TIME"
sudo cp /secrets/vivek/Icons/* /usr/share/icons -R
echo -e "DONE\n"
sudo umount -R /secrets

echo -e "\nSETTING UP PASSWORDS"
DIR=~/.password-store
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
git clone git@github.com:viveksray17/passwords ~/.password-store
cd ~/.password-store

# Set Default binsh to dash
sudo ln -sfn dash /bin/sh

echo -e "\nGetting Wallpapers"
mkdir -p $HOME/Pictures/Screenshots $HOME/Pictures/wallpapers
git clone git@github.com:viveksray17/wallpapers $HOME/Pictures/wallpapers

echo -e "\nGetting Bookmarks"
mkdir -p $HOME/.local/share/bookmarks
git clone git@github.com:viveksray17/bookmarks $HOME/.local/share/bookmarks

echo -e "\nRemoving Unecessary Services"
sudo rm /run/runit/service/agetty-tty3 /run/runit/service/agetty-tty4 /run/runit/service/agetty-tty5 /run/runit/service/agetty-tty6
echo -e "DONE"
