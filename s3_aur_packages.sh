#!/bin/sh
sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j5"/' /etc/makepkg.conf
yay -S sxiv-git ttf-ms-fonts --needed --noconfirm
yay -S libxft-bgra-git
