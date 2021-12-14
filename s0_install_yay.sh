#!/bin/bash
DIR=~/yay-bin
if [ -d "$DIR" ]; then
    sudo rm -rf "$DIR"
fi
git clone https://aur.archlinux.org/yay-bin ~/yay-bin
cd ~/yay-bin
makepkg -si
rm -rf ~/yay-bin
