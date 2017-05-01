#!/bin/bash

# Dotfiles installer
# By Pierre Faivre


always_overwrite=false
overwrite_once=false

function ask_overwrite() {
    echo -ne "Overwrite? (y\033[00;30mes\033[00;00m/n\033[00;30mo\033[00;00m/a\033[00;30mlways\033[00;00m) "
    read answer

    if [ $answer = "y" ]; then
        overwrite_once=true
    elif [ $answer = "a" ]; then
        overwrite_once=true
        always_overwrite=true
    else
        overwrite_once=false
    fi
}


function pre_install() {
    echo ""
    echo -e "\033[00;33m => Pre-installation...\033[00;00m"

    source ./pre_install.sh
}


function create_links() {
    echo ""
    echo -e "\033[00;33m => Linking the files into your home directory...\033[00;00m"

    pushd ./home > /dev/null

    # Loops recursively into the local "home" directory
    for element in `find . -printf '%P\n'`
    do
        ### Directory ###
        if [ -d $element ]; then
            mkdir -p "$HOME/$element"
        ### File ###
        elif [ -f $element ]; then
            # If it doesn't exist yet, just create the link
            if [ ! -f "$HOME/$element" ]; then
                ln -s `pwd`/$element $HOME/$element
                echo -e "\033[01;36mLinked\033[00;00m $HOME/$element"
            else
                # If it does exists but the user gave his/her consent
                if [ $always_overwrite = true ]; then
                    rm $HOME/$element
                    ln -s `pwd`/$element $HOME/$element
                    echo -e "\033[01;36mLinked\033[00;00m $HOME/$element"
                # Else, we ask him/her what to do
                else
                    echo -e "\033[00;31mExisting\033[00;00m $HOME/$element"
                    ask_overwrite
                    if [ $overwrite_once = true ]; then
                        rm $HOME/$element
                        ln -s `pwd`/$element $HOME/$element
                        echo -e "\033[01;36mLinked\033[00;00m $HOME/$element"
                    fi
                fi
            fi
        fi
    done

    popd > /dev/null
}

function install() {
    pre_install

    create_links

    echo ""
    echo -e "\033[00;32mAll set up.\033[00;00m"
}


echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│                             Dotfiles installer                               │"
echo "│                                                                              │"
echo "│ Before starting, make sure that you:                                         │"
echo "│  * correctly edited pre_install.sh                                           │"
echo "│  * placed your dotfiles into \"home\"                                          │"
echo "│                                                                              │"
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
