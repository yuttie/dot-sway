#!/bin/sh
laptop_output=eDP-1
if grep -q open /proc/acpi/button/lid/LID/state; then
    swaymsg output "$laptop_output" enable
else
    swaymsg output "$laptop_output" disable
fi
