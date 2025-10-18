#!/usr/bin/env bash

# Prints a Pango compatible string displaying a coloured card symbol changing every day

today=$( date +%d )

case $(($today % 4)) in
    0)
        echo "<span foreground='#1d1d1d'>♠</span>"
        ;;
    1)
        echo "<span foreground='#d53c3c'>♥</span>"
        ;;
    2)
        echo "<span foreground='#d53c3c'>♦</span>"
        ;;
    3)
        echo "<span foreground='#1d1d1d'>♣</span>"
        ;;
esac
