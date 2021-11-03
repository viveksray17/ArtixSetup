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

sudo cp /data/vivek/Downloads/internet/fonts/* /usr/share/fonts/ -R
# Update font cache
sudo fc-cache -fv

echo -e "\nCOPYING ICONS SO MAY TAKE SOME TIME"
sudo cp /data/vivek/Downloads/internet/DMZ-White /usr/share/icons -R
sudo cp /data/vivek/Downloads/internet/Icons/* /usr/share/icons -R

echo -e "\nAdding a command to /etc/profile to set the brightness on login"
sudo cp /data/vivek/extra/Backups/files/profile /etc/profile

echo -e "\nSet environment variable for qt5ct"
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee /etc/environment

echo -e "\nAdd shell script for android file transfer"
sudo cp /data/vivek/extra/Backups/files/android-file-transfer /usr/bin

echo -e "Transferring java binaries"
sudo mkdir /usr/lib/jvm
sudo cp /data/vivek/Downloads/internet/Software/jdk-17 /usr/lib/jvm -R
echo -e "DONE"
