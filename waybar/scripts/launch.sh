#!/usr/bin/env bash

pkill waybar

sleep 0.5

if hyprctl monitors | grep -q "HDMI-A-1"; then
    waybar -c ~/.config/waybar/primary_monitor.jsonc &
else
    waybar -c ~/.config/waybar/config.jsonc &
fi
