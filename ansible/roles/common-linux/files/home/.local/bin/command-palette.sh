#!/usr/bin/env bash

# This script opens a command palette using Rofi.
# Allows to perform various kinds of actions on the system.

selected=$(pkill rofi; \
           sed '1,/^### DATA ###$/d' $0 | \
           rofi -dmenu -p "Command palette :")

case $selected in
  # Theme
  "Theme: Summer Night")
    ~/.local/bin/set-theme.sh summer-night
    ;;
  "Theme: Summer Day")
    ~/.local/bin/set-theme.sh summer-day
    ;;
  "Theme: Cards Day")
    ~/.local/bin/set-theme.sh cards-day
    ;;
  "Theme: Ocean Dark")
    ~/.local/bin/set-theme.sh ocean-dark
    ;;
  "Theme: Bliss XP")
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

  # Display
  "Display: Color temperature")
    ~/.local/bin/set-screen-temperature.sh
    ;;

  # Utils
  "Utils: Color picker")
    sleep 0.1 # Give Rofi time to close
    hyprpicker -a
    ;;
  "Utils: Screenshot (full screen)")
    hyprshot -m output
    ;;
  "Utils: Screenshot (region)")
    hyprshot -m region
    ;;
  "Utils: Screenshot (window)")
    hyprshot -m window
    ;;

  # Personalization
  "Personalization: Next wallpaper")
    ~/.local/bin/set-wallpaper.sh next
    ;;

  # Setup
  "Setup: Audio")
    alacritty --class Popup --command wiremix
    ;;

  "Setup: Input")
    alacritty --class Popup --command nvim ~/.config/hypr/input.conf
    ;;

  "Setup: Keybindings")
    alacritty --class Popup --command nvim ~/.config/hypr/keybindings.conf
    ;;

  "Setup: Monitors")
    alacritty --class Popup --command nvim ~/.config/hypr/monitors.conf
    ;;

  "Setup: Hypridle")
    alacritty --class Popup --command nvim ~/.config/hypr/hypridle.conf
    ;;

  "Setup: Hyprsunset")
    alacritty --class Popup --command nvim ~/.config/hypr/hyprsunset.conf
    ;;

  "System: Kill process")
    ps -u $USER -o pid,comm | rofi -dmenu | awk "{print $1}" | xargs -r kill
    ;;

  # Suggestions for more: toggle idle inhibitor, toggle wifi/bluetooth, etc.
esac

exit 0

### DATA ###
Theme: Summer Night
Theme: Summer Day
Theme: Cards Day
Theme: Ocean Dark
Theme: Bliss XP
Power: Log-off
Power: Sleep
Power: Restart
Power: Shutdown
Display: Color temperature
Utils: Color picker
Utils: Screenshot (full screen)
Utils: Screenshot (region)
Utils: Screenshot (window)
Personalization: Next wallpaper
Setup: Audio
Setup: Input
Setup: Keybindings
Setup: Monitors
Setup: Hypridle
Setup: Hyprsunset
System: Kill process
