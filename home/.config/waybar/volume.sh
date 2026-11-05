#!/bin/sh
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{ print $2 }')
volume=$(pactl get-sink-volume @DEFAULT_SINK@ |
    awk 'NR == 1 { match($0, /[0-9]+%/); print substr($0, RSTART, RLENGTH) }')

if [ "$muted" = "yes" ]; then
    icon='\uf026'
else
    icon='\uf028'
fi

printf '%b %s\n' "$icon" "$volume"
