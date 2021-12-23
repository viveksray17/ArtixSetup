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
sudo cp /secrets/vivek/Breeze_Snow /usr/share/icons -R
sudo cp /secrets/vivek/Icons/* /usr/share/icons -R
echo -e "DONE\n"

DIR=~/.password-store
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
git clone git@github.com:viveksray17/passwords ~/.password-store
cd ~/.password-store

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

# Installing firefox
pip install requests beautifulsoup4 lxml
fetched_version=$($HOME/.scripts/get_firefox_version.py)
mkdir -p $HOME/Downloads/firefox_releases $HOME/Applications
install_firefox="wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/$fetched_version/linux-x86_64/en-US/firefox-$fetched_version.tar.bz2 -P $HOME/Downloads/firefox_releases/ && tar -xvf $HOME/Downloads/firefox_releases/firefox-$fetched_version.tar.bz2 -C $HOME/Applications"
sudo cp /secrets/vivek/files/firefox /usr/bin/firefox

# Set Default binsh to dash
sudo ln -sfn dash /bin/sh

# Create Necessary Directories
mkdir -p $HOME/Pictures/Screenshots $HOME/Pictures/wallpapers
git clone git@github.com:viveksray17/wallpapers
sudo umount -R /secrets
echo -e "DONE"
