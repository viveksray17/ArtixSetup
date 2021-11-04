#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
echo "Step1: Installing WIFI Drivers and essential networking packages"
pacman -S broadcom-wl wireless_tools --needed 
modprobe wl
echo -e "\nDONE\n"

echo "Step2: Installing Grephics Drivers and microcode"
pacman -S xf86-video-ati amd-ucode --noconfirm
echo -e "\nDONE\n"

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
