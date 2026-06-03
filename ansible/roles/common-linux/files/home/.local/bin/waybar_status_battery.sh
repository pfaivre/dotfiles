#!/usr/bin/env bash

# This script prints coloured hearts to reflect the battery charge in Waybar
#   ♥♥♥♥♥♥
#
# Example of output:
#   {"text": "<span color=\"#FF4444\">♥♥♥♥</span><span color=\"#777777\">♥♥</span>", "tooltip": "70%", "class": "battery-level"}

if [ -d /sys/class/power_supply/BAT0 ]; then
    BATPATH=/sys/class/power_supply/BAT0
elif [ -d /sys/class/power_supply/BAT1 ]; then
    BATPATH=/sys/class/power_supply/BAT1
else
    exit 0
fi

if [ -d $BATPATH ]; then
    BAT_FULL=$BATPATH/charge_full
    BAT_NOW=$BATPATH/charge_now
    bf=$(cat $BAT_FULL)
    bn=$(cat $BAT_NOW)

    level=$(( (100 * $bn + ($bf/2)) / $bf )) # ($bf/2) is here to round the division

    NB_HEARTS=6

    count=0
    alive_heart=$(( ($level * $NB_HEARTS + (100/2)) / 100))

    # if [ $level -lt 15 ]; then
    #     # TODO: show a different style when battery level is critical
    # fi

    ret="<span color=\\\"#FF4444\\\">"

    for (( i=1; i<=$alive_heart; i++ )); do
        ret="$ret♥"
        ((count++))
    done
    ret="$ret</span><span color=\\\"#777777\\\">"
    while [ $count -lt $NB_HEARTS ]; do
        ret="$ret♥"
        ((count++))
    done

    ret+="</span>"

    echo "{\"text\": \"$ret\", \"tooltip\": \"$level%\", \"class\": \"battery-level\"}"
fi
