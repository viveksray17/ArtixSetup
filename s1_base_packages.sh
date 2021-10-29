echo -e "ADDING UNIVERSE REPOSITORY"
sudo cp /data/vivek/extra/Backups/files/pacman.conf /etc/pacman.conf
# update repositories
sudo pacman -Syy
sudo pacman -S fuse2 base-devel wget gvfs pcmanfm man noto-fonts noto-fonts-emoji pavucontrol pulseaudio-alsa pulseaudio picom openssh lxappearance zsh arc-gtk-theme ttf-liberation qt5ct mpv brightnessctl xorg xorg-xinit librewolf scrot --needed
