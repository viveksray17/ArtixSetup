#!/bin/bash
DIR=~/yay-bin
if [ -d "$DIR" ]; then
    sudo rm -rf "$DIR"
fi
git clone https://aur.archlinux.org/yay-bin ~/yay-bin
pushd ~/yay-bin > /dev/null
makepkg -si
popd > /dev/null
rm -rf ~/yay-bin
