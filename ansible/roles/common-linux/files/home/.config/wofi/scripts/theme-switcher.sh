#!/bin/bash

entries="Everforest\nEverforest-Light\nOcean-Dark\nBliss-XP"

selected=$(pkill wofi; echo -e $entries|wofi --dmenu $2 --style .config/mydesktop/current-theme/wofi/style.css --hide-scroll --cache-file /dev/null)

case $selected in
  Everforest)
    rm -f ~/.config/mydesktop/current-theme
    ln -s ~/.config/mydesktop/themes/everforest ~/.config/mydesktop/current-theme

    # killall -SIGUSR2 waybar  # Does not reload css entirely
    pkill waybar; hyprctl dispatch exec "waybar -s ~/.config/mydesktop/current-theme/waybar/style.css"
    hyprctl reload
    ~/.config/hypr/set-wallpaper.sh
    # hyprctl hyprpaper reload ,~/.config/mydesktop/current-theme/wallpaper/wallpaper.jpg
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

    # killall -SIGUSR2 waybar  # Does not reload css entirely
    pkill waybar; hyprctl dispatch exec "waybar -s ~/.config/mydesktop/current-theme/waybar/style.css"
    hyprctl reload
    ~/.config/hypr/set-wallpaper.sh
    # hyprctl hyprpaper reload ,~/.config/mydesktop/current-theme/wallpaper/wallpaper.jpg
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

  Ocean-Dark)
    rm -f ~/.config/mydesktop/current-theme
    ln -s ~/.config/mydesktop/themes/ocean-dark ~/.config/mydesktop/current-theme

    # killall -SIGUSR2 waybar  # Does not reload css entirely
    pkill waybar; hyprctl dispatch exec "waybar -s ~/.config/mydesktop/current-theme/waybar/style.css"
    hyprctl reload
    ~/.config/hypr/set-wallpaper.sh
    # hyprctl hyprpaper reload ,~/.config/mydesktop/current-theme/wallpaper/wallpaper.jpg
    swaync-client --reload-css
    touch ~/.config/alacritty/alacritty.toml

    rm -f ~/.config/gtk-4.0/gtk.css
    rm -f ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/ocean-dark/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/ocean-dark/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme Everforest-Dark-Medium

    # Unfortunately, some GTK 4 apps like Nautilus won't change until next log-in
    ;;

  Bliss-XP)
    rm -f ~/.config/mydesktop/current-theme
    ln -s ~/.config/mydesktop/themes/bliss-xp ~/.config/mydesktop/current-theme

    # killall -SIGUSR2 waybar  # Does not reload css entirely
    pkill waybar; hyprctl dispatch exec "waybar -s ~/.config/mydesktop/current-theme/waybar/style.css"
    hyprctl reload
    ~/.config/hypr/set-wallpaper.sh
    # hyprctl hyprpaper reload ,~/.config/mydesktop/current-theme/wallpaper/wallpaper.jpg
    swaync-client --reload-css
    touch ~/.config/alacritty/alacritty.toml

    rm -f ~/.config/gtk-4.0/gtk.css
    rm -f ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/bliss-xp/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
    ln -s ~/.config/mydesktop/themes/bliss-xp/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    gsettings set org.gnome.desktop.interface gtk-theme Everforest-Light-Medium

    # Unfortunately, some GTK 4 apps like Nautilus won't change until next log-in
    ;;
esac
