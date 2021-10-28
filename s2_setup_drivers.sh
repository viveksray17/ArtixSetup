#!/usr/bin/env bash
echo "Step1: Installing WIFI Drivers and essential networking packages"
sleep 1
pacman -S broadcom-wl wireless_tools --needed 
modprobe wl
echo -e "\nDone\n\n"
sleep 1

echo "Step2: Installing Grephics Drivers and microcode"
sleep 1
pacman -S xf86-video-ati amd-ucode --noconfirm
echo -e "\nDONE\n"
sleep 1

echo "Removing Screen Tearing"
sleep 1
touch /etc/X11/xorg.conf.d/20-radeon.conf
echo 'Section "Device"
    Identifier  "Radeon"
    Driver "radeon"
    Option "AccelMethod" "glamor"
    Option "DRI" "3"
    Option "TearFree" "on"
    Option "ColorTiling" "on"
    Option "ColorTiling2D" "on"
EndSection' > /etc/X11/xorg.conf.d/20-radeon.conf
echo "DONE"
