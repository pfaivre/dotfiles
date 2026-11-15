#!/usr/bin/env bash

# file=$(find ~/Documents -type f | rofi -dmenu -normalize-match -theme-str 'window {width: 50%;}')
file=$(find ~/Documents -type f | fzf)

# fzf cancelled (empty selection)
if [ -z "$file" ]; then
    exit 0
fi

if [ -e "$file" ]; then
    # Launch Thunar in its own session (setsid --fork) so it survives this script
    # exiting, whether the script runs in a popup terminal or bare from a keybind.
    # The path is passed as a single quoted argument — never interpolated into a
    # hyprctl eval Lua string (command injection).
    setsid --fork thunar "$file" >/dev/null 2>&1 </dev/null
else
    echo "File not found: $file"
fi
