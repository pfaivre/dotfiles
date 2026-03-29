#!/usr/bin/env bash

# This script opens a command palette using Rofi.
# Allows to perform various kinds of actions on the system.

selected=$(pkill rofi; \
           sed '1,/^### DATA ###$/d' $0 | \
           rofi -dmenu -p "Command palette :")

# Open the given file in a neovim popup window (with Alacritty), or in default text editor if neovim is not installed
open_text_file() {
  if [ -x "$(command -v nvim)" ]; then
    alacritty --class Popup --command nvim $1
  else
    xdg-open $1
  fi
}

case $selected in
  # Theme
  "Theme → Summer Night")
    ~/.local/bin/set-theme.sh summer-night
    ;;
  "Theme → Summer Day")
    ~/.local/bin/set-theme.sh summer-day
    ;;
  "Theme → Cards Day")
    ~/.local/bin/set-theme.sh cards-day
    ;;
  "Theme → Ocean Dark")
    ~/.local/bin/set-theme.sh ocean-dark
    ;;
  "Theme → Bliss XP")
    ~/.local/bin/set-theme.sh bliss-xp
    ;;

  # Power
  "Power → Log-off")
    loginctl terminate-user $USER
    ;;
  "Power → Sleep")
    systemctl suspend
    ;;
  "Power → Restart (reboot)")
    systemctl reboot
    ;;
  "Power → Shutdown (poweroff)")
    systemctl poweroff
    ;;

  # Display
  "Display → Color temperature")
    ~/.local/bin/set-screen-temperature.sh
    ;;

  # Utils
  "Utils → Color picker")
    sleep 0.1 # Give Rofi time to close
    color=$(hyprpicker -a)
    notify-send -e -u low "Color picker" "Color copied to the clipboard: $color"
    ;;
  "Utils → Screenshot (full screen)")
    hyprshot -m output
    ;;
  "Utils → Screenshot (region)")
    hyprshot -m region
    ;;
  "Utils → Screenshot (window)")
    hyprshot -m window
    ;;

  "Utils → Select an emoji")
    ~/.local/bin/select-emoji-fr.sh
    notify-send -e -u low "Emoji" "The selected emoji has been copied to the clipboard"
    ;;

  # Personalization
  "Personalization → Next wallpaper")
    ~/.local/bin/set-wallpaper.sh next
    ;;

  # Setup
  "Setup → Audio")
    alacritty --class Popup --command wiremix
    ;;

  "Setup → Input")
    open_text_file ~/.config/hypr/input.conf
    ;;

  "Setup → Keybindings")
    open_text_file ~/.config/hypr/keybindings.conf
    ;;

  "Setup → Monitors")
    open_text_file ~/.config/hypr/monitors.conf
    ;;

  "Setup → Hypridle")
    open_text_file ~/.config/hypr/hypridle.conf
    ;;

  "Setup → Hyprsunset")
    open_text_file ~/.config/hypr/hyprsunset.conf
    ;;

  "System → Kill process")
    ps -u $USER -o pid,comm | rofi -dmenu | awk "{print $1}" | xargs -r kill
    ;;

  # Suggestions for more: toggle idle inhibitor, toggle wifi/bluetooth, etc.
esac

exit 0

### DATA ###
Theme → Summer Night
Theme → Summer Day
Theme → Cards Day
Theme → Ocean Dark
Theme → Bliss XP
Power → Log-off
Power → Sleep
Power → Restart (reboot)
Power → Shutdown (poweroff)
Display → Color temperature
Utils → Color picker
Utils → Screenshot (full screen)
Utils → Screenshot (region)
Utils → Screenshot (window)
Utils → Select an emoji
Personalization → Next wallpaper
Setup → Audio
Setup → Input
Setup → Keybindings
Setup → Monitors
Setup → Hypridle
Setup → Hyprsunset
System → Kill process
