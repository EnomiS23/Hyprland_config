#!/bin/bash

# Pornește KOrganizer
korganizer &

# Așteaptă să se încarce fereastra
sleep 1.5

# Focalizează fereastra
hyprctl dispatch focuswindow "class:org.kde.korganizer"
sleep 0.2

# O setează flotant
hyprctl dispatch floatwindow

# Redimensionare și poziționare
sleep 0.2
hyprctl dispatch movewindowpixel exact 200 200
hyprctl dispatch resizewindowpixel exact 400 400
