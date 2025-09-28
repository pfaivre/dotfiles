#!/bin/bash

# This script provides a sort of command palette using Wofi.
# It provides a list of commands that can perform various kinds of actions

selected=$(pkill wofi; \
           sed '1,/^### DATA ###$/d' $0 | \
           wofi -M fuzzy --show dmenu --style ~/.config/mydesktop/current-theme/wofi/style.css --hide-scroll --cache-file /dev/null)

case $selected in
  # Theme
  "Theme: Everforest")
    ~/.local/bin/set-theme.sh everforest
    ;;
  "Theme: Everforest-Light")
    ~/.local/bin/set-theme.sh everforest-light
    ;;
  "Theme: Ocean-Dark")
    ~/.local/bin/set-theme.sh ocean-dark
    ;;
  "Theme: Bliss-XP")
    ~/.local/bin/set-theme.sh bliss-xp
    ;;

  # Power
  "Power: Log-off")
    loginctl terminate-user $USER
    ;;
  "Power: Sleep")
    systemctl suspend
    ;;
  "Power: Restart")
    systemctl reboot
    ;;
  "Power: Shutdown")
    systemctl poweroff
    ;;

  # Suggestions for more: toggle hyprshade, toggle inhibitor, toggle wifi/bluetooth, etc.
esac

### DATA ###
Theme: Everforest
Theme: Everforest-Light
Theme: Ocean-Dark
Theme: Bliss-XP
Power: Log-off
Power: Sleep
Power: Restart
Power: Shutdown
