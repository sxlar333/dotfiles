#!/bin/sh
# Wi-Fi / Ethernet indicator for Waybar

signal=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi 2>/dev/null |
    awk -F: '$1 == "yes" { print $NF; exit }')

if [ -n "$signal" ]; then
    printf '%b %s%%\n' '\uf1eb' "$signal"
elif nmcli -t -f TYPE,STATE device status 2>/dev/null |
    grep -q '^ethernet:connected'; then
    printf '%b\n' '\uf1e6'
else
    printf '%b off\n' '\uf1eb'
fi
