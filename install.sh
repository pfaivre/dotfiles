#!/bin/bash

# Dotfiles installer with Ansible
# By Pierre Faivre


function install_ansible() {
    echo ""
    echo -e "\033[00;33m => Installing Ansible...\033[00;00m"

    . /etc/os-release

    if [ -z ${ID+x} ]; then
        echo "Could not detect the OS, abort."
        exit 1
    else
        echo "Detected OS: $ID"

        case $ID in

        ubuntu)
            sudo apt install -qy ansible-core
            ;;

        fedora)
            sudo dnf install -qy ansible-core
            ;;

        *)
            echo "OS not supported, abort."
            exit 1
            ;;
        esac
    fi
}


function run_ansible() {
    # Suppress warning about inventory not set
    # That's normal because we only configure the local computer
    export ANSIBLE_LOCALHOST_WARNING=False
    export ANSIBLE_INVENTORY_UNPARSED_WARNING=False

    ansible --version | grep core

    ansible-playbook --ask-become-pass $(dirname "$0")/ansible-main.yaml
}


function install() {
    if ! [ which ansible-playbook >/dev/null 2>&1 ]; then
        install_ansible
    fi

    run_ansible
    
    if [ $? -ne 0 ]; then
        echo "The configuration failed, see above for details"
        echo ""
        exit 1
    fi

    echo ""
    if  which lolcat >/dev/null 2>&1; then
        echo "You are good to go." | lolcat
    else
        echo "You are good to go."
    fi
}

RESET="\x1B[0m"
CLREOL="\x1B[K" # Needed to continue background color to the end of the line
bg_black="\x1b[48;2;0;0;0m"
fg_white="\x1b[38;5;255m"
fg_red="\x1b[38;5;197m"
fg_orange="\x1b[38;5;208m"
fg_yellow="\x1b[38;5;226m"
fg_green="\x1b[38;5;118m"
fg_turqoise="\x1b[38;5;121m"
fg_cyan="\x1b[38;5;51m"
fg_blue="\x1b[38;5;33m"
fg_violet="\x1b[38;5;55m"

echo -e "$bg_black$fg_white$CLREOL"
echo -e "$fg_violet░█▀▄░$fg_blue▄▀▀▄░$fg_cyan▀█▀░$fg_turqoise█▀▀░$fg_green░▀░░$fg_yellow█░░$fg_orange█▀▀░$fg_red█▀▀$fg_white$CLREOL"
echo -e "$fg_violet░█░█░$fg_blue█░░█░$fg_cyan░█░░$fg_turqoise█▀░░$fg_green░█▀░$fg_yellow█░░$fg_orange█▀▀░$fg_red▀▀▄$fg_white$CLREOL"
echo -e "$fg_violet░▀▀░░$fg_blue░▀▀░░$fg_cyan░▀░░$fg_turqoise▀░░░$fg_green▀▀▀░$fg_yellow▀▀░$fg_orange▀▀▀░$fg_red▀▀▀$fg_white$CLREOL"
echo -e "$CLREOL"
echo -e "$fg_white Before starting, make sure that you$CLREOL"
echo -e "$fg_white  * correctly edited ansible files$CLREOL"
echo -e "$fg_white  * placed your dotfiles into \"home\"$CLREOL"
echo -e "$CLREOL"
echo -e "$fg_white More info at https://github.com/pfaivre/dotfiles$CLREOL"
echo -e "$CLREOL"
echo -ne "$CLREOL"
read -p "Do you wish to continue? (y/n) " confirm
echo -e "$RESET"

if [ $confirm = "y" ]; then
    install
    echo ""
else
    echo "Aborted"
    exit 0
fi
