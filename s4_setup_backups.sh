#!/bin/bash
# REMOVE SSH DIRECTORY IF IT EXISTS
DIR=~/.ssh
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
mkdir ~/.ssh
cp /data/vivek/extra/Backups/ssh/* ~/.ssh

# NVIM SETUP
echo -e "\nINSTALLING vim-plug for nvim\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo -e "DONE"

# STARSHIP PROMPT
echo -e "\nINSTALLING starship prompt\n"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo -e "DONE"
chsh -s /usr/bin/zsh

sudo cp /data/vivek/extra/Backups/files/grub /etc/default/grub
# Update grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# A CUSTOM RUNIT SERVICE TO CHANGE BRIGHTNESS ON BOOT
sudo cp /data/vivek/extra/Backups/brightness /etc/runit/sv/ -R
sudo ln -s /etc/runit/sv/brightness /run/runit/service

sudo cp /data/vivek/Downloads/internet/fonts/* /usr/share/fonts/ -R
# Update font cache
sudo fc-cache -fv

echo -e "\nCOPYING ICONS SO MAY TAKE SOME TIME"
sudo cp /data/vivek/Downloads/internet/Breeze_Snow /usr/share/icons -R
sudo cp /data/vivek/Downloads/internet/Icons/* /usr/share/icons -R
echo -e "DONE"
