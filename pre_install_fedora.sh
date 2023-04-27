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
sudo dnf -qy install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -qy install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo ""

applications=(
    # Command line utilities
    btop htop most git vim pwgen sloccount tmux ranger ncdu pv zsh wireguard-tools

    # Extra packages
    neofetch lolcat toilet cmatrix \

    # Applications
    vlc

    # for Fedora i3 spin
    # picom rofi xautolock
)

echo "Installing applications..."
sudo dnf -qy install ${applications[*]}

echo ""

packages_to_remove=(
    aajohan*
    akonadi*
    akregator
    elisa-player
    espeak-ng
    gdouros-*
    google-noto-cjk-fonts*
    google-noto-naskh
    google-noto-naskh*
    google-noto-sans-arabic*
    google-noto-sans-armenian*
    google-noto-sans-canadian
    google-noto-sans-canadian*
    google-noto-sans-cherokee*
    google-noto-sans-cjk*
    google-noto-sans-ethiopic*
    google-noto-sans-georgian*
    google-noto-sans-gurmukhi*
    google-noto-sans-hebrew*
    google-noto-sans-lao*
    google-noto-sans-mono-vf-fonts*
    google-noto-sans-sinhala*
    google-noto-sans-thaana*
    google-noto-serif-vf-fonts*
    jomolhari-fonts
    kaddressbook
    kde-connect
    khmer-os*
    kmahjongg
    kmail
    kmines
    kmouth
    kolourpaint
    kontact
    konversation
    korganizer
    kpatience
    krdc
    krfb
    lohit-*
    paktype-*-fonts
    plasma-welcome
    qt5-qdbusviewer
    rit-*-fonts
    sil-*-fonts
    thai-*-fonts
    vazirmatn-*-fonts
)

echo "Removing selection of packages..."
sudo dnf remove ${packages_to_remove[*]}

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
    sudo dnf -qy install zsh
    chsh -s `which zsh`
else
    echo "Zsh already installed"
fi

echo ""

# Oh-My-Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    git clone -q https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
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
sudo dnf -qy remove NetworkManager-config-connectivity-fedora

# Disable automatic dnf cache refresher
echo "Disabling automatic dnf cache refresher..."
sudo systemctl disable --now dnf-makecache.timer

# Disable hibernation
echo "Disabling hibernation..."
sudo systemctl mask hibernate.target

popd > /dev/null # Restoring previous location

