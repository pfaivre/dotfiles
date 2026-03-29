#!/usr/bin/env bash

# This script allows to select which color temperature to apply to the screen
# It relies on hyprsunset

selected=$(pkill rofi; \
           sed '1,/^### DATA ###$/d' $0 | \
           rofi -dmenu -p "foo")

echo $selected

if [[ "$selected" == Identity* ]]; then
    hyprctl hyprsunset identity
else
    hyprctl hyprsunset temperature $selected
fi

exit 0

### DATA ###
Identity (no color adjustment)
6000
5000
4500
4000
3500
