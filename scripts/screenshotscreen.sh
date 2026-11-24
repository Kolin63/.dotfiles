#!/usr/bin/env bash

dateid="$(date +%Y-%m-%d_%H-%M-%S)"
file="$HOME/Pictures/Screenshots/$dateid.png"
i=0
while [[ -e "$file" ]]; do
  file="$HOME/Pictures/Screenshots/${dateid}_$i.png"
  i=$(( $i + 1 ))
done

grim "$file" || exit

wl-copy -t image/png < "$file"
notify-send -t 3000 -i "$file" "Screenshot taken!" "Image copied to clipboard and saved to $file"
