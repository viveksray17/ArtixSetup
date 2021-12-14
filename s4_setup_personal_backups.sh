#!/bin/sh

sudo mount /dev/sda4 /secrets
# REMOVE SSH DIRECTORY IF IT EXISTS
DIR=~/.ssh
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
mkdir ~/.ssh
cp /secrets/vivek/ssh/* ~/.ssh

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

sudo umount -R /secrets
echo -e "DONE"
