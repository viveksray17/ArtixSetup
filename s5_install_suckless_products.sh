#!/bin/bash
software=(
    "st"
    "slock"
    "dmenu"
    "dwm"
    "dwmblocks"
)
for SOFTWARE in "${software[@]}"; do
    cd ~/suckless/$SOFTWARE
    sudo make clean install
done
