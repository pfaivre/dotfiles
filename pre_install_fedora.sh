#!/bin/bash

# Dotfiles installer
# By Pierre Faivre

# Put in this file all the commands you want to perform before installing your dotfiles

# We don't use "cd" because we want to restore the previous location 
# at the end of this script:
pushd ~ > /dev/null

# ------------------------------
#  Applications
# ------------------------------

echo "Adding RPM Fusion repositories..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo ""

applications=(
    # Command line utilities
    htop most git vim pwgen sloccount tmux ranger ncdu pv zsh wireguard-tools

    # Extra packages
    neofetch lolcat toilet cmatrix \

    # Applications
    vlc
)

echo "Installing applications..."
sudo apt -qy install ${applications[*]}

echo ""

packages_to_remove=(
    
)

echo "Removing selection of packages..."
sudo dnf remove -qy ${packages_to_remove[*]}

echo ""

# Vim-plug
echo "Installing Vim-plug..."
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# You will need to call ":PlugInstall" on vim afterwards
echo -e "\033[01;32mYou will need to call ":PlugInstall" on vim afterwards\033[0m"

echo ""

# ------------------------------
#  Shell
# ------------------------------

# Zsh
if ! which zsh >/dev/null 2>&1; then
    echo "Installing zsh..."
    sudo dnf install zsh
    chsh -s `which zsh`
else
    echo "Zsh already installed"
fi

echo ""

# Oh-My-Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    git clone -q git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "Oh My Zsh already installed"
fi

echo ""

# Base16 shell theming
if [ ! -d ~/.config/base16-shell ]; then
    echo "Installing Base16 Shell..."
    git clone -q https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
else
    echo "Base16 Shell already installed"
fi

echo ""

# Remove portal detector
# This causes constant calls to fedoraproject.org
echo "Disabling Fedora's connectivity checking network portal detector thing..."
sudo dnf remove NetworkManager-config-connectivity-fedora

# Disable automatic dnf cache refresher
echo "Disabling automatic dnf cache refresher..."
sudo systemctl disable --now dnf-makecache.timer

popd > /dev/null # Restoring previous location
