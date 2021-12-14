#!/bin/bash
software=(
    "st"
    "slock"
    "dmenu"
    "dwm"
    "dwmblocks"
)
mkdir ~/suckless
for SOFTWARE in "${software[@]}"; do
    git clone https://github.com/viveksray17/$SOFTWARE ~/suckless/$SOFTWARE
    cd ~/suckless/$SOFTWARE
    sudo make clean install
done
