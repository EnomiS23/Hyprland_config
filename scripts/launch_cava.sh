#!/bin/bash

# Închide orice instanță existentă a kitty cu clasa cava_widget
pkill -f "kitty --class cava_widget"

sleep 0.2

# Lansează Kitty transparent cu cava
kitty --class cava_widget \
      --name cava_widget \
      --override background_opacity=0.0 \
      --override font_size=6 \
      -e cava &