#!/bin/bash

# Dotfiles installer
# By Pierre Faivre

# Put in this file all the commands you want to perform before installing your dotfiles


pushd ~


# ------------------------------
#  Applications
# ------------------------------

applications=(
    # Command line utilities
    htop most git vim pwgen sloccount tmux ranger ncdu \
    
    # Some usefull applications
    p7zip-full sublime-text redshift-gtk \

    # Extra packages
    fonts-crosextra-carlito fonts-cantarell ttf-mscorefonts-installer \
    screenfetch lolcat toilet
)

echo "Installing applications..."
sudo apt-get -qy install ${applications[*]}

if ! which ranger >/dev/null 2>&1; then
    git clone -q git://git.savannah.nongnu.org/ranger.git /tmp/ranger
    pushd /tmp/ranger
    sudo make install
    popd
else
    echo "Ranger already installed"
fi

# Vim-plug (for Vim's Lightline)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# ------------------------------
#  Shell
# ------------------------------

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

if [ ! -d ~/.config/base16-shell ]; then
    echo "Installing Base16 Shell..."
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
else
    echo "Base16 Shell already installed"
fi

popd
