#!/usr/bin/env bash

# This script replaces the link "~/.config/mydesktop/current-theme" with the selected theme
# And reloads all the components of the desktop to apply the changes
# Look at .config/mydesktop/themes/ for available themes

# Apply the selected theme, if found
if [[ -d "$HOME/.config/mydesktop/themes/$1" ]]; then
    echo "Found theme ~/.config/mydesktop/themes/$1"

    # Replace the base theme folder (with a link)
    rm -f ~/.config/mydesktop/current-theme
    ln -s ~/.config/mydesktop/themes/$1 ~/.config/mydesktop/current-theme

    # Reload components
    pkill waybar; hyprctl dispatch exec "waybar -s ~/.config/mydesktop/current-theme/waybar/style.css"
    hyprctl reload
    ~/.local/bin/set-wallpaper.sh
    swaync-client --reload-css
    touch ~/.config/alacritty/alacritty.toml

    rm -f ~/.config/gtk-4.0/gtk.css
    rm -f ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/$1/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/$1/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css

    if [[ -f "$HOME/.config/mydesktop/themes/$1/light.mode" ]]; then
        echo "Setting light mode"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    else
        echo "Setting dark mode"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    fi
    # gsettings set org.gnome.desktop.interface gtk-theme Everforest-Dark-Medium
else
    echo "Theme not found ~/.config/mydesktop/themes/$1"
fi
