#!/usr/bin/env python3
"""
A script to convert a hexadecimal color to various formats and display them in a rofi menu.
The user can select a format to copy it to the clipboard.
"""

import sys
import subprocess
import re


def hex_to_rgb(hex_color: str) -> str:
    """Convert a hexadecimal color to RGB format."""
    hex_color = hex_color.lstrip('#')
    if len(hex_color) == 3:
        hex_color = ''.join([c * 2 for c in hex_color])
    r = int(hex_color[0:2], 16)
    g = int(hex_color[2:4], 16)
    b = int(hex_color[4:6], 16)
    return f"rgb({r}, {g}, {b})"


def hex_to_hsl(hex_color: str) -> str:
    """Convert a hexadecimal color to HSL format."""
    hex_color = hex_color.lstrip('#')
    if len(hex_color) == 3:
        hex_color = ''.join([c * 2 for c in hex_color])
    r = int(hex_color[0:2], 16) / 255.0
    g = int(hex_color[2:4], 16) / 255.0
    b = int(hex_color[4:6], 16) / 255.0
    
    max_val = max(r, g, b)
    min_val = min(r, g, b)
    delta = max_val - min_val
    
    # Calculate Lightness
    l = (max_val + min_val) / 2.0
    
    # Calculate Saturation
    if delta == 0:
        h = 0
        s = 0
    else:
        s = delta / (1 - abs(2 * l - 1))
        
        # Calculate Hue
        if max_val == r:
            h = 60 * (((g - b) / delta) % 6)
        elif max_val == g:
            h = 60 * (((b - r) / delta) + 2)
        else:
            h = 60 * (((r - g) / delta) + 4)
    
    h = round(h)
    s = round(s * 100)
    l = round(l * 100)
    return f"hsl({h}, {s}%, {l}%)"


def hex_to_cmyk(hex_color: str) -> str:
    """Convert a hexadecimal color to CMYK format."""
    hex_color = hex_color.lstrip('#')
    if len(hex_color) == 3:
        hex_color = ''.join([c * 2 for c in hex_color])
    r = int(hex_color[0:2], 16) / 255.0
    g = int(hex_color[2:4], 16) / 255.0
    b = int(hex_color[4:6], 16) / 255.0
    
    k = 1 - max(r, g, b)
    if k == 1:
        c = m = y = 0
    else:
        c = (1 - r - k) / (1 - k)
        m = (1 - g - k) / (1 - k)
        y = (1 - b - k) / (1 - k)
    
    c = round(c * 100)
    m = round(m * 100)
    y = round(y * 100)
    k = round(k * 100)
    return f"cmyk({c}%, {m}%, {y}%, {k}%)"


def hex_to_hypr(hex_color: str) -> str:
    """Convert a hexadecimal color to Hyprland color format (opaque)."""
    h = hex_color.split('#')[1]
    return f"0xFF{h}"


def copy_to_clipboard(text: str):
    """Copy text to the clipboard using xclip or wl-copy."""
    try:
        subprocess.run(['wl-copy'], input=text.encode('utf-8'), check=True)
    except FileNotFoundError:
        print("Error: wl-copy is not found.")
        sys.exit(1)


def show_rofi_menu(options: list[str]) -> str:
    """Display a rofi menu with the given options and return the selected one."""
    try:
        result = subprocess.run(
            ['rofi', '-dmenu', '-p', 'Select color format:'],
            input='\n'.join(options),
            text=True,
            capture_output=True,
            check=True
        )
        return result.stdout.strip()
    except FileNotFoundError:
        print("Error: rofi is not installed. Please install rofi.")
        sys.exit(1)
    except subprocess.CalledProcessError:
        print("Error: rofi returned an error code.")
        sys.exit(1)


def main():
    if len(sys.argv) != 2:
        print("Usage: color-menu.py <hex_color>")
        print("Example: color-menu.py #FE5623")
        sys.exit(1)
    
    hex_color = sys.argv[1]
    if not re.match(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$', hex_color):
        print("Error: Invalid hexadecimal color format.")
        sys.exit(1)
    
    if not hex_color.startswith('#'):
        hex_color = '#' + hex_color
    
    rgb = hex_to_rgb(hex_color)
    hsl = hex_to_hsl(hex_color)
    cmyk = hex_to_cmyk(hex_color)
    hypr = hex_to_hypr(hex_color)
    
    options = [
        f"HEX: {hex_color}",
        f"RGB: {rgb}",
        f"HSL: {hsl}",
        f"CMYK: {cmyk}",
        f"Hypr: {hypr}"
    ]
    
    selected_option = show_rofi_menu(options)
    if not selected_option:
        sys.exit(0)
    
    # Extract the value after the colon
    selected_value = selected_option.split(': ', 1)[1]
    copy_to_clipboard(selected_value)
    print(f"Copied to clipboard: {selected_value}")


if __name__ == '__main__':
    main()
