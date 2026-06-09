#!/usr/bin/env bash

# file=$(find ~/Documents -type f | rofi -dmenu -normalize-match -theme-str 'window {width: 50%;}')
file=$(find ~/Documents -type f | fzf)

if [ -e "$file" ]; then
    # Ask Hyprland to run Thunar for us, so that the script can terminate
    hyprctl eval "hl.exec_cmd('thunar \"$file\"')"
else
    echo "File not found: $file"
fi
