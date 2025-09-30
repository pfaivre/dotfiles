#!/usr/bin/env bash

# This script is aimed at new installations.
# If the .config/mydeskyop/current-theme link is absent, it means the installation is not complete yet.

if [[ ! -d "$HOME/.config/mydesktop/current-theme" ]]; then
    echo "Desktop not configured yet, configuring..."
    ~/.local/bin/set-theme.sh ocean-dark
    notify-send -t 120000 "Hi there!" "Welcome to your new desktop. You can press Super+Space to open an app, or Super+Esc to open the command palette"
else
    echo "Initial configuration has already been done."
fi
