#!/usr/bin/env bash

# This script sets or changes the wallpaper (with Hyprpaper) with any one inside ".config/mydesktop/current-theme/wallpaper/"
# Only files prefixed with "wallpaper*" are considered

# Usage:
# $ set-wallpaper.sh first
# $ set-wallpaper.sh next
# $ set-wallpaper.sh

DEBUG=0

WALLPAPER_DIR="$HOME/.config/mydesktop/current-theme/wallpaper/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)
CURRENT_WALL_NAME=$(basename $CURRENT_WALL)

# FIXME: listloaded is not a supported command anymore, making the "next" argument non-functional
# can we find a workaround?

if [[ DEBUG -eq 1 ]]; then
    echo "DEBUG: CURRENT_WALL=$CURRENT_WALL"
    echo "DEBUG: CURRENT_WALL_NAME=$CURRENT_WALL_NAME"
fi

mapfile -d '' -t AVAILABLE_WALL < <(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" -print0 | sort -k 2,2 -t. -u)
AVAILABLE_WALL_COUNT=$(ls -1q $WALLPAPER_DIR/wallpaper* | wc -l)
echo "Available wallpapers: $AVAILABLE_WALL_COUNT"
if [[ DEBUG -eq 1 ]]; then
    echo "DEBUG: AVAILABLE_WALL=$AVAILABLE_WALL"
fi

# Get the first wallpaper
if [ $AVAILABLE_WALL_COUNT -eq 1 ] || [[ $1 = "first" ]]; then
    if [[ DEBUG -eq 1 ]]; then
        echo "DEBUG: Chose option \"first\""
    fi
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" | sort -k 2,2 -t. -u | head -n 1)

# Get the next wallpaper
elif [[ $1 = "next" ]]; then
    if [[ DEBUG -eq 1 ]]; then
        echo "DEBUG: Chose option \"next\""
    fi
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
    if [[ DEBUG -eq 1 ]]; then
        echo "DEBUG: Chose option \"random\""
    fi
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f,l -name "wallpaper*" ! -name "$CURRENT_WALL_NAME" | shuf -n 1)

fi

if [[ DEBUG -eq 1 ]]; then
    echo "DEBUG: Chosen wallpaper: $WALLPAPER"
fi

# Apply the selected wallpaper, if found
if [[ ! -z "$WALLPAPER" ]]; then
    hyprctl hyprpaper wallpaper ",$WALLPAPER, cover"
fi
