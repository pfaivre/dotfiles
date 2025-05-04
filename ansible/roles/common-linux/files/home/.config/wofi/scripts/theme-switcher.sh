#!/bin/bash

# Work in progress.
# This will be a theme selector

entries="Everforest\nEverforest-Light"

selected=$(echo -e $entries|wofi --dmenu $2 --style .config/mydesktop/current-theme/wofi/style.css --hide-scroll --cache-file /dev/null)

case $selected in
  Everforest)
    rm -f ~/.config/mydesktop/current-theme
    ln -s ~/.config/mydesktop/themes/everforest ~/.config/mydesktop/current-theme

    killall -SIGUSR2 waybar
    hyprctl reload
    hyprctl hyprpaper reload ,~/.config/mydesktop/current-theme/wallpaper/wallpaper.png
    swaync-client --reload-css
    touch ~/.config/alacritty/alacritty.toml

    rm -f ~/.config/gtk-4.0/gtk.css
    rm -f ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/everforest/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/everforest/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme Everforest-Dark-Medium

    # Unfortunately, some GTK 4 apps like Nautilus won't change until next log-in
    ;;

  Everforest-Light)
    rm -f ~/.config/mydesktop/current-theme
    ln -s ~/.config/mydesktop/themes/everforest-light ~/.config/mydesktop/current-theme

    killall -SIGUSR2 waybar
    hyprctl reload
    hyprctl hyprpaper reload ,~/.config/mydesktop/current-theme/wallpaper/wallpaper.png
    swaync-client --reload-css
    touch ~/.config/alacritty/alacritty.toml

    rm -f ~/.config/gtk-4.0/gtk.css
    rm -f ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/everforest-light/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/everforest-light/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    gsettings set org.gnome.desktop.interface gtk-theme Everforest-Light-Medium

    # Unfortunately, some GTK 4 apps like Nautilus won't change until next log-in
    ;;
esac
