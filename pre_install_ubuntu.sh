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

applications=(
    # Command line utilities
    htop most git vim pwgen sloccount tmux ranger ncdu pv \
    
    # Some usefull applications
    p7zip-full \
    # redshift-gtk \

    # Extra packages
    fonts-crosextra-carlito fonts-cantarell ttf-mscorefonts-installer \
    screenfetch lolcat toilet cmatrix \

    # i3 window manager
    #i3 dunst compton i3lock-fancy suckless-tools nitrogen feh
)

echo "Installing applications..."
sudo apt -qqy install ${applications[*]}

echo ""

packages_to_remove=(
    fonts-tlwg-purisa-ttf
    fonts-tibetan-machine
    fonts-kacst-one
    fonts-lohit-beng-bengali
    fonts-tlwg-mono
    fonts-smc-dyuthi
    fonts-thai-tlwg
    fonts-tlwg-waree-ttf
    fonts-smc-meera
    fonts-tlwg-kinnari
    fonts-teluguvijayam
    fonts-tlwg-sawasdee
    fonts-tlwg-sawasdee-ttf
    fonts-smc-suruma
    fonts-orya-extra
    fonts-lao
    fonts-tlwg-typist
    fonts-smc
    fonts-smc-karumbi
    fonts-knda
    fonts-gubbi
    fonts-tlwg-garuda
    fonts-tlwg-purisa
    fonts-lohit-gujr
    fonts-lohit-guru
    fonts-tlwg-norasi-ttf
    fonts-tlwg-typo-ttf
    fonts-lato
    fonts-lohit-mlym
    fonts-smc-manjari
    fonts-telu-extra
    fonts-samyak-gujr
    fonts-tlwg-typo
    fonts-tlwg-typist-ttf
    fonts-tlwg-garuda-ttf
    fonts-sahadeva
    fonts-samyak-mlym
    fonts-beng
    fonts-gujr
    fonts-guru
    fonts-smc-chilanka
    fonts-sil-padauk
    fonts-lohit-taml
    fonts-beng-extra
    fonts-mlym
    fonts-lohit-telu
    fonts-tlwg-laksaman
    fonts-gujr-extra
    fonts-lohit-deva
    fonts-gargi
    fonts-tlwg-umpush-ttf
    fonts-samyak-taml
    fonts-kacst
    fonts-yrsa-rasa
    fonts-smc-keraleeyam
    fonts-tlwg-mono-ttf
    fonts-lohit-orya
    fonts-tlwg-typewriter
    fonts-kalapi
    fonts-samyak-deva
    fonts-smc-rachana
    fonts-navilu
    fonts-taml
    fonts-noto-cjk
    fonts-smc-uroob
    fonts-telu
    fonts-khmeros-core
    fonts-smc-raghumalayalamsans
    fonts-nakula
    fonts-lohit-beng-assamese
    fonts-tlwg-kinnari-ttf
    fonts-smc-anjalioldlipi
    fonts-lklug-sinhala
    fonts-pagul
    fonts-deva
    fonts-tlwg-loma
    fonts-tlwg-norasi
    fonts-deva-extra
    fonts-sil-abyssinica
    fonts-tlwg-loma-ttf
    fonts-tlwg-umpush
    fonts-guru-extra
    fonts-tlwg-laksaman-ttf
    fonts-smc-gayathri
    fonts-orya
    fonts-tlwg-waree
    fonts-lohit-knda
    fonts-lohit-taml-classical
    fonts-indic
    fonts-tlwg-typewriter-ttf
    fonts-sarai
)

echo "Removing selection of packages..."
sudo apt -qqy purge ${packages_to_remove[*]}

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
    sudo apt -qqy install zsh
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

popd > /dev/null # Restoring previous location

