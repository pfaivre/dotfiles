#!/usr/bin/env bash

# This script replaces the link "~/.config/mydesktop/current-theme" with the selected theme
# And reloads all the components of the desktop to apply the changes
# Look at .config/mydesktop/themes/ for available themes

# Print the gtk-application-prefer-dark-theme value (0 or 1) from GTK3 settings.ini
gtk3_dark_pref() {
    sed -n 's/^gtk-application-prefer-dark-theme[[:space:]]*=[[:space:]]*\([01]\).*/\1/p' ~/.config/gtk-3.0/settings.ini 2>/dev/null
}

# Restart Thunar so it picks up the new GTK3 settings.ini (read only at startup),
# re-opening the folders that were shown in each window. Leaves Thunar untouched
# if the folder list cannot be obtained or if Thunar refuses to quit.
restart_thunar() {
    local folders
    folders=$(timeout 5 python3 ~/.local/bin/thunar-open-folders.py 2>/dev/null) || return 0
    [[ -n "$folders" ]] || return 0

    mapfile -t thunar_folders < <(printf '%s\n' "$folders" | sort -u)

    thunar --quit
    for _ in $(seq 1 20); do
        pgrep -x thunar > /dev/null || break
        sleep 0.1
    done
    if pgrep -x thunar > /dev/null; then
        echo "Thunar did not quit; skipping restart"
        return 0
    fi

    setsid --fork thunar "${thunar_folders[@]}" > /dev/null 2>&1 < /dev/null
}

# Apply the selected theme, if found
if [ -z "$1" ]; then
    echo "Please specify a theme name. Available themes:"
    ls "$HOME/.config/mydesktop/themes/"
    exit 1
fi

# Reject path traversal: the theme name must be a single path component
case $1 in
    */*|*..*)
        echo "Invalid theme name: $1"
        exit 1
        ;;
esac

if [[ -d "$HOME/.config/mydesktop/themes/$1" ]]; then
    echo "Found theme ~/.config/mydesktop/themes/$1"

    # Replace the base theme folder (with a link)
    rm -f ~/.config/mydesktop/current-theme
    ln -s ~/.config/mydesktop/themes/"$1" ~/.config/mydesktop/current-theme

    # Reload components
    python3 ~/.local/bin/set-wallpaper.py &
    killall -INT waybar; hyprctl eval 'hl.exec_cmd("waybar -s ~/.config/mydesktop/current-theme/waybar/style.css")'
    hyprctl reload
    killall -INT swaync; hyprctl eval 'hl.exec_cmd("swaync --style ~/.config/mydesktop/current-theme/swaync/style.css --config ~/.config/mydesktop/current-theme/swaync/config.json")'
    touch ~/.config/alacritty/alacritty.toml

    # Remember the current dark-mode preference before replacing the GTK settings
    old_dark=$(gtk3_dark_pref)

    # GTK settings dirs may not exist yet on a fresh install
    mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
    rm -f ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini
    ln -s ~/.config/mydesktop/themes/"$1"/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
    ln -s ~/.config/mydesktop/themes/"$1"/gtk-4.0/settings.ini ~/.config/gtk-4.0/settings.ini

    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
    if [[ -f "$HOME/.config/mydesktop/themes/$1/light.mode" ]]; then
        echo "Setting light mode"
        gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
    else
        echo "Setting dark mode"
        gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    fi

    # GTK3 apps read settings.ini only at startup, so a running Thunar keeps the
    # old tint after a light/dark switch. Restart it so the new colors apply now,
    # re-opening the folders that were shown in each window.
    new_dark=$(gtk3_dark_pref)
    if [[ -n "$new_dark" && "$old_dark" != "$new_dark" ]] && pgrep -x thunar > /dev/null; then
        restart_thunar
    fi
else
    echo "Theme not found ~/.config/mydesktop/themes/$1"
fi
