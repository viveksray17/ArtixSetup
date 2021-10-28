DIR=~/yay-bin
if [ -d "$DIR" ]; then
    sudo rm -rf "$DIR"
fi
command git clone https://aur.archlinux.org/yay-bin ~/yay-bin
command cd ~/yay-bin
command makepkg -si
command rm -rf ~/yay-bin
