#!/bin/bash
command echo ".dotfiles.git" >> ~/.gitignore
DIR=~/.dotfiles.git
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
command git clone --bare git@github.com:viveksray17/dotfiles.git $HOME/.dotfiles.git
command /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout --force
command /usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME config --local status.showUntrackedFiles no
