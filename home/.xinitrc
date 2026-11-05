#!/bin/sh

# Load X resources. 2bwm reads its twobwm.* colors/borders from here.
if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

# Solid fallback background (install x11-apps/xsetroot to enable this).
if command -v xsetroot >/dev/null 2>&1; then
    xsetroot -solid "#11111b"
fi

# Optional compositor for shadows/transparency.
# if command -v picom >/dev/null 2>&1; then
#     picom --config "$HOME/.config/picom/picom.conf" &
# fi

# Optional status bar. Create ~/.config/polybar/config.ini first.
# if command -v polybar >/dev/null 2>&1; then
#     polybar main &
# fi

# Start the session inside D-Bus when available, with one terminal open.
if command -v dbus-run-session >/dev/null 2>&1; then
    exec dbus-run-session -- sh -c '
        if command -v kitty >/dev/null 2>&1; then
            kitty &
        fi
        exec 2bwm
    '
fi

if command -v kitty >/dev/null 2>&1; then
    kitty &
fi

exec 2bwm
