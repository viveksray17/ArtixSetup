#!/usr/bin/env bash
echo -e "installing paq nvim"
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

echo -e "\nInstalling Pyright"
sudo npm install -g pyright

echo -e "\nRemoving Unecessary Services"
sudo rm -rf /run/runit/service/agetty-tty3 /run/runit/service/agetty-tty4 /run/runit/service/agetty-tty5 /run/runit/service/agetty-tty6
echo -e "DONE"
