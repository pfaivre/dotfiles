#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/mydesktop/current-theme/wallpaper/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Inside current-theme/wallpaper/ regular desktop wallpapers are always prefixed "wallpaper"

# Get a random wallpaper that is not the current one
# WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Get a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" | shuf -n 1)

# Apply the selected wallpaper, if found
if [[ ! -z "$WALLPAPER" ]]; then
    hyprctl hyprpaper reload ,"$WALLPAPER"
fi
