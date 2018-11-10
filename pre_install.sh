#!/bin/bash

# Dotfiles installer
# By Pierre Faivre

# Put in this file all the commands you want to perform before installing your dotfiles

# We don't use "cd" because we want to restore the previous location 
# at the end of this script:
pushd ~

# ------------------------------
#  Applications
# ------------------------------

applications=(
    # Command line utilities
    htop most git vim pwgen sloccount tmux ranger ncdu pv \
    
    # Some usefull applications
    p7zip-full sublime-text redshift-gtk \

    # Extra packages
    fonts-crosextra-carlito fonts-cantarell ttf-mscorefonts-installer \
    screenfetch lolcat toilet cmatrix \

    # i3 window manager
    i3 dunst compton i3lock-fancy suckless-tools nitrogen feh
)

echo "Installing applications..."
sudo apt-get -qy install ${applications[*]}

# Ranger
if ! which ranger >/dev/null 2>&1; then
    git clone -q git://git.savannah.nongnu.org/ranger.git /tmp/ranger
    pushd /tmp/ranger
    sudo make install
    popd
else
    echo "Ranger already installed"
fi

# Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# You will need to call ":PlugInstall" on vim afterwards


# ------------------------------
#  Shell
# ------------------------------

# Zsh
if ! which zsh >/dev/null 2>&1; then
    echo "Installing zsh..."
    sudo apt-get -qy install zsh
    chsh -s `which zsh`
else
    echo "Zsh already installed"
fi

# Oh-My-Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    git clone -q git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "Oh My Zsh already installed"
fi

# Base16 shell theming
if [ ! -d ~/.config/base16-shell ]; then
    echo "Installing Base16 Shell..."
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
else
    echo "Base16 Shell already installed"
fi

popd # Restoring previous location

