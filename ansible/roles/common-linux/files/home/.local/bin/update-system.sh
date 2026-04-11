#!/usr/bin/env bash

FG_BLUE="\033[01;34m"
RESET="\e[0m"

function update_flatpak() {
    if command -v flatpak >/dev/null 2>&1; then
        echo -e "\n${FG_BLUE}Updating Flatpak...$RESET"
        flatpak update -y
    fi
}

function update_system() {
    . /etc/os-release

    if [ -z ${ID+x} ]; then
        echo "Could not detect the OS, cancelled."
    else
        echo -e "\n${FG_BLUE}Updating the system...$RESET"

        case $ID in

        ubuntu)
            sudo apt update
            sudo apt upgrade
            ;;

        fedora)
            sudo dnf update
            ;;

        opensuse-tumbleweed)
            sudo zypper dup
            ;;

        *)
            echo "OS '$ID' not supported, cancelled."
            ;;
        esac
    fi
}

update_system
update_flatpak
