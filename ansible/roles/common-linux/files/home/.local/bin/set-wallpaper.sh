#!/usr/bin/env bash

# This script sets or changes the wallpaper (with Hyprpaper) with any one inside ".config/mydesktop/current-theme/wallpaper/"
# Only files prefixed with "wallpaper*" are considered

# Usage:
# $ set-wallpaper.sh first
# $ set-wallpaper.sh next
# $ set-wallpaper.sh

WALLPAPER_DIR="$HOME/.config/mydesktop/current-theme/wallpaper/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)
CURRENT_WALL_NAME=$(basename $CURRENT_WALL)

mapfile -d '' -t AVAILABLE_WALL < <(find "$WALLPAPER_DIR" -name "wallpaper*" -type f,l -print0 | sort -z)
AVAILABLE_WALL_COUNT=$(ls -1q $WALLPAPER_DIR/wallpaper* | wc -l)
echo "Available wallpapers: $AVAILABLE_WALL_COUNT"

# Get the first wallpaper
if [ $AVAILABLE_WALL_COUNT -eq 1 ] || [[ $1 = "first" ]]; then
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" | head -n 1)

# Get the next wallpaper
elif [[ $1 = "next" ]]; then
    # Find current file index
    INDEX=-1
    for i in "${!AVAILABLE_WALL[@]}"; do
        if [[ "${AVAILABLE_WALL[$i]}" == "$CURRENT_WALL" ]]; then
            INDEX=$i
            break
        fi
    done

    # Get next file (wrap around)
    if [[ $INDEX -eq -1 ]]; then
        # Use the first file when no match was found
        WALLPAPER="${AVAILABLE_WALL[0]}"
    else
        NEXT_INDEX=$(((INDEX + 1) % AVAILABLE_WALL_COUNT))
        WALLPAPER="${AVAILABLE_WALL[$NEXT_INDEX]}"
    fi

# Get a random wallpaper that is not the current one
else
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" ! -name "$CURRENT_WALL_NAME" | shuf -n 1)

fi

# Apply the selected wallpaper, if found
if [[ ! -z "$WALLPAPER" ]]; then
    hyprctl hyprpaper reload ,"$WALLPAPER"
fi
