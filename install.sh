#!/bin/bash

# Dotfiles installer
# By Pierre Faivre

always_overwrite=0
overwrite_once=0

function ask_overwrite() {
    echo -ne "Overwrite? (y\033[00;30mes\033[00;00m/n\033[00;30mo\033[00;00m/a\033[00;30mlways\033[00;00m) "
    read answer

    if [ $answer = "y" ]; then
        overwrite_once=1
    elif [ $answer = "n" ]; then
        overwrite_once=0
    else
        overwrite_once=1
        always_overwrite=1
    fi
}

function install_dependencies() {
    echo ""
    echo -e "\033[00;33mInstalling dependencies...\033[00;00m"

    # TODO
}

function create_links() {
    echo ""
    echo -e "\033[00;33mLinking the files into your home directory...\033[00;00m"

    cd ./home

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
                ln ./$element $HOME/$element
                echo -ne "\033[01;36mLinked\033[00;00m "
                echo $HOME/$element
            else
                # If it does exists but the user gave his/her consent
                if [ $always_overwrite = "1" ]; then
                    rm $HOME/$element
                    ln ./$element $HOME/$element
                    echo -ne "\033[01;36mLinked\033[00;00m "
                    echo $HOME/$element
                # Else, we ask him/her what to do
                else
                    echo -ne "\033[00;31mExisting\033[00;00m "
                    echo $HOME/$element
                    ask_overwrite
                    if [ $overwrite_once = "1" ]; then
                        rm $HOME/$element
                        ln ./$element $HOME/$element
                        echo -ne "\033[01;36mLinked\033[00;00m "
                        echo $HOME/$element
                    fi
                fi
            fi
        fi
    done

    cd - > /dev/null 2>&1
}

function install() {
    install_dependencies

    create_links

    echo ""
    echo -e "\033[00;32mAll set up.\033[00;00m"
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
