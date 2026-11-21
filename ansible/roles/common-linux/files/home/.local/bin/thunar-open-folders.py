#!/usr/bin/env python3

# Print the folder shown in each open Thunar window, one absolute path per line.
# Used by set-theme.sh to re-open the same windows when Thunar is restarted
# (GTK3 apps only read settings.ini at startup, so they must be restarted when
# switching between a light and a dark theme).
#
# The current folder of a window is rebuilt from its path-bar buttons, read
# through the accessibility (AT-SPI) tree: those buttons are listed
# current-folder-first, so reversing them and prepending "/" gives the full
# path. Requires python3-pyatspi.

import os
import sys

MAX_NODES = 2000  # cap the tree walk so windows showing many files stay fast
MAX_DEPTH = 12


def window_folder(win, home: str) -> str:
    title = win.name or ""
    base = title.rsplit(" - Thunar", 1)[0] if title.endswith(" - Thunar") else title

    # Depth-first sequence of (role, name) in the window's accessibility tree
    seq = []

    def walk(acc, depth):
        if len(seq) >= MAX_NODES or depth > MAX_DEPTH:
            return
        seq.append((acc.getRoleName(), acc.name or ""))
        for c in range(acc.childCount):
            walk(acc.getChildAtIndex(c), depth + 1)

    walk(win, 0)

    # The path-bar button matching the window title is the current folder;
    # the toggle buttons right after it are its parents, current-first
    components = None
    for idx, (role, name) in enumerate(seq):
        if role == "toggle button" and name == base:
            components = [name]
            for role2, name2 in seq[idx + 1:]:
                # the path bar ends at the root button, which has an empty name
                if role2 != "toggle button" or not name2:
                    break
                components.append(name2)
            break

    if components is None:
        # Root and special windows (trash, search) have no path buttons
        return home

    path = "/" + "/".join(reversed(components))
    return path if os.path.isdir(path) else home


def main() -> int:
    try:
        import pyatspi
    except ImportError:
        return 1

    home = os.path.expanduser("~")
    desktop = pyatspi.Registry.getDesktop(0)
    for i in range(desktop.childCount):
        app = desktop.getChildAtIndex(i)
        if not app or "thunar" not in (app.name or "").lower():
            continue
        for w in range(app.childCount):
            win = app.getChildAtIndex(w)
            if win.getRoleName() == "frame":
                print(window_folder(win, home))
    return 0


if __name__ == "__main__":
    sys.exit(main())
