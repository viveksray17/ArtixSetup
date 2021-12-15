#!/bin/bash
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
    mkdir $dir
    cp /secrets/vivek/$DIR/* $dir -R
done

# NVIM SETUP
echo -e "\nINSTALLING vim-plug for nvim\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo -e "DONE"

sudo cp /secrets/vivek/files/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo cp /secrets/vivek/fonts/* /usr/share/fonts/ -R
sudo fc-cache -fv

echo -e "\nCOPYING ICONS SO MAY TAKE SOME TIME"
sudo cp /secrets/vivek/volantes_light_cursors /usr/share/icons -R
sudo cp /secrets/vivek/Icons/* /usr/share/icons -R
echo -e "DONE\n"
DIR=~/.password-store
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
git clone https://github.com/viveksray17/passwords ~/.password-store
cd ~/.password-store
git remote remove origin
git remote add origin git@github.com:viveksray17/passwords
software=(
    "st"
    "slock"
    "dmenu"
    "dwm"
    "dwmblocks"
)
for SOFTWARE in "${software[@]}"; do
    cd ~/suckless/$SOFTWARE
    git remote remove origin
    git remote add origin git@github.com:viveksray17/$SOFTWARE
done

# Set Default binsh to dash
sudo ln -sfn dash /bin/sh

sudo umount -R /secrets
echo -e "DONE"
