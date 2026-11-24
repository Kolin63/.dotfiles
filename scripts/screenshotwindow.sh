#!/usr/bin/env bash

# https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/spawninfo/screenshotwin

# Get client info
read -r PID
read -r TITLE
read -r APPID
read -r TAGS
read -r GEOMETRY

if [[ -z "$GEOMETRY" ]]; then
  exit 1
fi

dateid="$(date +%Y-%m-%d_%H-%M-%S)"
file="$HOME/Pictures/Screenshots/$dateid.png"
i=0
while [[ -e "$file" ]]; do
  file="$HOME/Pictures/Screenshots/${dateid}_$i.png"
  i=$(( $i + 1 ))
done

# Grab the screenshot! Very conveniently, GEOMETRY format matches the one
# expected by grim
grim -g "$GEOMETRY" "$file" || exit

wl-copy -t image/png < "$file"
notify-send -t 3000 -i "$file" "Screenshot taken!" "Image copied to clipboard and saved to $file"
