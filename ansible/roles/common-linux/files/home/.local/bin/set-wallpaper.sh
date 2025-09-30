#!/usr/bin/env bash

# This script sets or changes the wallpaper (with Hyprpaper) with any one inside ".config/mydesktop/current-theme/wallpaper/"
# Only files prefixed with "wallpaper*" are considered

WALLPAPER_DIR="$HOME/.config/mydesktop/current-theme/wallpaper/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)
CURRENT_WALL=$(basename $CURRENT_WALL)

AVAILABLE_WALL_COUNT=$(ls -1q $WALLPAPER_DIR/wallpaper* | wc -l)
echo Available: $AVAILABLE_WALL_COUNT

if [ $AVAILABLE_WALL_COUNT -eq 1 ] || [[ $1 = "first" ]]; then
    # Get the first wallpaper
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" | head -n 1)
else
    #Get a random wallpaper that is not the current one
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" ! -name "$CURRENT_WALL" | shuf -n 1)
fi

# Apply the selected wallpaper, if found
if [[ ! -z "$WALLPAPER" ]]; then
    hyprctl hyprpaper reload ,"$WALLPAPER"
fi
