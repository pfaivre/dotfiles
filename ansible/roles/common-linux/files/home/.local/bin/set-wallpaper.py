from pathlib import Path
from time import sleep
import os
import random
import sys
import subprocess

HOME = Path.home()
WALLPAPER_DIR = Path(HOME / ".config" / "mydesktop" / "current-theme" / "wallpaper")
WALLPAPER_LINK = Path(WALLPAPER_DIR / "wallpaper.jpg")


def get_wallpaper_files() -> list[Path]:
    """Return a sorted list of wallpaper files matching the pattern 'wallpaper-*.*'"""
    if not WALLPAPER_DIR.exists():
        print(f"Error: Wallpaper directory not found: {WALLPAPER_DIR}", file=sys.stderr)
        sys.exit(1)
    
    wallpapers = sorted(WALLPAPER_DIR.glob("wallpaper-*.*"))
    
    if not wallpapers:
        print(f"Error: No wallpaper files found in {WALLPAPER_DIR}", file=sys.stderr)
        sys.exit(1)
    
    # Filter out directories, non-readable files, and the wallpaper.jpg link itself
    valid_wallpapers = [
        wp for wp in wallpapers 
        if wp.is_file() and os.access(wp, os.R_OK) and wp.name != "wallpaper.jpg"
    ]
    
    if not valid_wallpapers:
        print(f"Error: No valid wallpaper files found in {WALLPAPER_DIR}", file=sys.stderr)
        sys.exit(1)
    
    print(f"\nAvailable wallpapers in {WALLPAPER_DIR}:")
    for w in valid_wallpapers:
        print(w.name)

    return valid_wallpapers


def refresh_hyprpaper():
    """Tell Hyprpaper to show the image behind the current wallpaper.jpg link"""
    # Hard version: kill then restart hyprpaper
    try:
        # Get the PID of any old hyprpaper instances
        result = subprocess.run(
            ["pidof", "hyprpaper"],
            timeout=1,
            capture_output=True,
            text=True
        )
        if result.returncode == 0:
            old_hyprpaper_pid = result.stdout.strip()  # Can contain multiple PIDs "8965 4325 3245"
        else:
            old_hyprpaper_pid = ""

        # Run a new hyprpaper
        result = subprocess.run(
            ["hyprctl", "dispatch", "exec", "'hyprpaper'"],
            timeout=1,
            capture_output=True,
            text=True
        )
        if result.returncode != 0:
            raise Exception(f"Return code: {result.returncode}, Error: {result.stderr}")
        
        if old_hyprpaper_pid:
            # Relax a bit
            sleep(0.8)

            # Kill the old hyprpaper
            result = subprocess.run(
                ["kill", *old_hyprpaper_pid.split(" ")],
                timeout=1,
                capture_output=True,
                text=True
            )
            if result.returncode != 0:
                raise Exception(f"Return code: {result.returncode}, Error: {result.stderr}")

    except subprocess.TimeoutExpired:
        print("Error: The hyprctl hyprpaper command timed out after 3 seconds.", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
    
    # Soft version: use the IPC (seems to not work anymore)
    # try:
    #     command = ["hyprctl", "hyprpaper", "wallpaper", f"', {str(WALLPAPER_LINK)}, cover'"]
    #     print(f"Calling: {' '.join(command)}")
    #     # Run the command with a 3-second timeout
    #     result = subprocess.run(
    #         ["hyprctl", "hyprpaper", "wallpaper", f"', {str(WALLPAPER_LINK)}, cover'"],
    #         timeout=3,
    #         capture_output=True,
    #         text=True
    #     )
    #     if result.returncode != 0:
    #         raise Exception(f"Return code: {result.returncode}, Error: {result.stderr}")
    # except subprocess.TimeoutExpired:
    #     print("Error: The hyprctl hyprpaper command timed out after 3 seconds.", file=sys.stderr)
    #     sys.exit(1)
    # except Exception as e:
    #     print(f"Error: Failed to notify the hyprpaper IPC: {e}", file=sys.stderr)
    #     sys.exit(1)


def set_wallpaper(target):
    """Create a symbolic link from WALLPAPER_LINK to target, then call the IPC to show it"""
    try:
        # Remove existing link or file if it exists
        if WALLPAPER_LINK.exists():
            if WALLPAPER_LINK.is_symlink():
                WALLPAPER_LINK.unlink()
            else:
                # Handle case where wallpaper.jpg is a regular file
                WALLPAPER_LINK.unlink()
        
        # Create parent directory if it doesn't exist
        WALLPAPER_LINK.parent.mkdir(parents=True, exist_ok=True)
        
        # Create the symbolic link
        WALLPAPER_LINK.symlink_to(target)

        print("\nReplaced link:")
        print(f"{WALLPAPER_LINK} -> {target}")
        
    except Exception as e:
        print(f"Error: Failed to create wallpaper link: {e}", file=sys.stderr)
        sys.exit(1)

    refresh_hyprpaper()


def get_current_wallpaper_index(wallpapers):
    """Return the index of the current wallpaper in the wallpapers list"""
    if not WALLPAPER_LINK.exists():
        return -1
    
    try:
        current_target = WALLPAPER_LINK.resolve()
        for i, wp in enumerate(wallpapers):
            if wp.resolve() == current_target:
                return i
    except Exception:
        pass
    
    return -1


def main():
    wallpapers = get_wallpaper_files()
    
    # Determine mode based on command line arguments
    if len(sys.argv) > 1:
        mode = sys.argv[1].lower()
    else:
        mode = "default"
    
    # Default mode: create link to first wallpaper if it doesn't exist
    if mode == "default":
        if WALLPAPER_LINK.exists():
            # Link already exists, don't replace it, just ensure hyprpaper picks the current one
            refresh_hyprpaper()
            return
        else:
            set_wallpaper(wallpapers[0])
    
    # Next mode: cycle to the next wallpaper
    elif mode == "next":
        current_index = get_current_wallpaper_index(wallpapers)
        
        if current_index == -1:
            # No current wallpaper, use the first one
            next_index = 0
        else:
            # Cycle to the next wallpaper, wrapping around if needed
            next_index = (current_index + 1) % len(wallpapers)
        
        set_wallpaper(wallpapers[next_index])
    
    # Random mode: select a random wallpaper
    elif mode == "random":
        random_wallpaper = random.choice(wallpapers)
        set_wallpaper(random_wallpaper)
    
    else:
        print(f"Error: Unknown mode '{sys.argv[1]}'", file=sys.stderr)
        print("Usage:", file=sys.stderr)
        print("  set-wallpaper.py          # Create link to first wallpaper (if doesn't exist)", file=sys.stderr)
        print("  set-wallpaper.py next     # Cycle to next wallpaper", file=sys.stderr)
        print("  set-wallpaper.py random   # Select random wallpaper", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
