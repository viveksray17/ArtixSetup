#!/bin/sh
sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j5"/' /etc/makepkg.conf
yay -S sxiv-git ttf-ms-fonts
