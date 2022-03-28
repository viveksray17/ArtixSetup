#!/bin/bash
software=(
    "st"
    "slock"
    "dmenu"
)
for SOFTWARE in "${software[@]}"; do
    pushd ~/build/$SOFTWARE > /dev/null
    sudo make clean install
    popd > /dev/null
done
