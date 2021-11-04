#!/bin/bash
sudo cp /data/vivek/extra/Backups/files/makepkg.conf /etc/makepkg.conf
# aur packages
yay -S firefox-beta-bin sxiv-git libxft-bgra-git ttf-ms-fonts zsh-completions-git zsh-syntax-highlighting-git nitrogen-git --needed
