# NVIM SETUP
echo -e "\nINSTALLING vim-plug for neovim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo -e "DONE"

echo -e "\nGetting Wallpapers"
mkdir -p $HOME/Pictures/Screenshots $HOME/Pictures/wallpapers
git clone git@github.com:viveksray17/wallpapers $HOME/Pictures/wallpapers

echo -e "\nGetting Bookmarks"
mkdir -p $HOME/.local/share/bookmarks
git clone git@github.com:viveksray17/bookmarks $HOME/.local/share/bookmarks

echo -e "\nRemoving Unecessary Services"
sudo rm /run/runit/service/agetty-tty3 /run/runit/service/agetty-tty4 /run/runit/service/agetty-tty5 /run/runit/service/agetty-tty6
echo -e "DONE"
