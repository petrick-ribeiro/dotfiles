#!/usr/bin/bash
WALLPAPERS_DIR=$HOME/.config/assets
# WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
WALLPAPER="$WALLPAPERS_DIR/wallpaper.jpg"

# RUN
swww-daemon --format xrgb &
sleep 0.1 &&
swww img "$WALLPAPER"
