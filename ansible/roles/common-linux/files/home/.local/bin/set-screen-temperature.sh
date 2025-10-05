#!/usr/bin/env bash

# This script allows to select which color temperature to apply to the screen
# It relies on hyprsunset

selected=$(pkill rofi; \
           sed '1,/^### DATA ###$/d' $0 | \
           rofi -dmenu)

hyprctl hyprsunset temperature $selected

exit 0

### DATA ###
6000
5000
4500
4000
3500
