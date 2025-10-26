#!/usr/bin/env bash

# for startup operations
if [ ! -e /tmp/.sbashrcWasRan ]; then
  touch /tmp/.sbashrcWasRan
  if [ -e ~/.lsbashrc ]; then
    source ~/.lsbashrc # for local startup
  fi
  if [ -e ~/.dotfiles/sbashrc ]; then
    source ~/.dotfiles/sbashrc # startup for all machines
  fi
fi

[ -e /bin/dwm ] && [ -e /bin/feh ] && feh --bg-scale ~/.dotfiles/dwm/wallpaper.jpg

while [ -e /bin/dwm ]; do
  dwm
done
