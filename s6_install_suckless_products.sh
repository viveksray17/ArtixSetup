#!/bin/bash
software_dirs=(
    "/data/vivek/st"
    "/data/vivek/slock"
    "/data/vivek/dmenu"
)
for DIR in "${software_dirs[@]}"; do
    command cd $DIR
    command sudo make clean install
done
