#!/bin/bash

# Dotfiles installer with Ansible
# By Pierre Faivre


function install_ansible() {
    echo ""
    echo -e "\033[00;33m => Install Ansible...\033[00;00m"

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

    ansible-playbook --ask-become-pass $(dirname "$0")/ansible-main.yaml
}


function install() {
    if  which ansible-playbook >/dev/null 2>&1; then
        echo -e "\nAnsible is available\n"
    else
        install_ansible
    fi

    run_ansible

    echo ""
    if  which lolcat >/dev/null 2>&1; then
        echo "You are good to go." | lolcat
    else
        echo "You are good to go."
    fi
}


echo "┌──────────────────────────────────────────────────────────────────────────────┐"
echo "│                             Dotfiles installer                               │"
echo "│                                                                              │"
echo "│ Before starting, make sure that you:                                         │"
echo "│  * correctly edited ansible files                                            │"
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
