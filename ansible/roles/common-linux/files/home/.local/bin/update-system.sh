#!/usr/bin/env bash

FG_BLUE="\033[01;34m"
RESET="\e[0m"

function print_banner() {
    local title="$1"
    local width=50
    local line
    printf -v line '%*s' "$width" ''
    line=${line// /─}

    echo -e "\n${FG_BLUE}┌${line}┐"
    echo -e "${FG_BLUE}│${RESET}  ${title}$(printf '%*s' $((width - 2 - ${#title})) '')${FG_BLUE}│"
    echo -e "${FG_BLUE}└${line}┘${RESET}"
}

function update_flatpak() {
    if command -v flatpak >/dev/null 2>&1; then
        print_banner "Updating Flatpak"
        flatpak update -y
    fi
}

function update_system() {
    . /etc/os-release

    if [ -z ${ID+x} ]; then
        echo "Could not detect the OS, cancelled."
    else
        print_banner "Updating the system"

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

function update_omz() {
    if [ -f "$HOME/.oh-my-zsh/tools/upgrade.sh" ]; then
        print_banner "Updating Oh My Zsh"
        ~/.oh-my-zsh/tools/upgrade.sh -v minimal
    fi
}

update_system
update_flatpak
update_omz
