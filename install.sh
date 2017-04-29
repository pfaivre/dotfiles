#!/bin/bash

# Dotfiles installer
# By Pierre Faivre


function install() {
    echo "Work in progress"
    exit 1
}


echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│                             Dotfiles installer                               │"
echo -e "│ \033[01;31mWarning:\033[01;00m This dotfiles repository is a personal set of configuration files.  │"
echo "│ It will probably not suit your needs.                                        │"
echo "│ Moreover it is only intended to work on Linux Mint 18.1.                     │"
echo "│ More info at https://github.com/pfaivre/dotfiles                             │"
echo "└──────────────────────────────────────────────────────────────────────────────┘"
echo ""
read -p "Do you wish to continue? (y/n) " confirm

if [ $confirm = "y" ]; then
    install
else
    echo "Aborted"
    exit 0
fi
