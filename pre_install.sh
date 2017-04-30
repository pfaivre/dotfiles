#!/bin/bash

# Dotfiles installer
# By Pierre Faivre

# Put in this file all the commands you want to perform before installing your dotfiles

applications=(htop most git redshift-gtk sublime-text fonts-cantarell \
              p7zip-full pwgen ttf-mscorefonts-installer sloccount \
              fonts-crosextra-carlito)


cd ~

echo "Installing applications..."
sudo apt-get -qy install ${applications[*]}

if ! which zsh >/dev/null 2>&1; then
    echo "Installing zsh..."
    sudo apt-get -qy install zsh
    chsh -s `which zsh`
else
    echo "Zsh already installed"
fi

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    git clone -q git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "Oh My Zsh already installed"
fi

cd - > /dev/null 2>&1
