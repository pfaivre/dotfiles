#!/bin/bash

# Work in progress.
# This will be a theme selector

entries="Everforest\nEverforest-Day"
source='source = ~/.config/hypr/themes/'
# hyprland-conf=~/.config/hypr/hyprland.conf
# delete-line="$(sed -i '1d' ~/.config/hypr/hyprland.conf)"

selected=$(echo -e $entries|wofi --dmenu $2 --style ~/.config/wofi/themes/everforest/style.css --hide-scroll --cache-file /dev/null)

case $selected in
  Everforest)
    notify-send "Everforest"
    # sed -i '1d' ~/.config/hypr/hyprland.conf
    # sed -i '1i\source = ~/.config/hypr/themes/summer-night/style.conf' ~/.config/hypr/hyprland.conf
    ;;
  Everforest-Day)
    notify-send "Everforest-Day"
    # sed -i '1d' ~/.config/hypr/hyprland.conf
    # sed -i '1i\source = ~/.config/hypr/themes/summer-day/style.conf' ~/.config/hypr/hyprland.conf
    ;;
esac
