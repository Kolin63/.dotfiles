#!/usr/bin/env bash

# for startup operations
if [ ! -e /tmp/.sbashrcWasRan ]; then
  touch /tmp/.sbashrcWasRan
  if [ -e ~/.dotfiles/lsbashrc ]; then
    source ~/.dotfiles/lsbashrc # for local startup
  fi
  if [ -e ~/.dotfiles/sbashrc ]; then
    source ~/.dotfiles/sbashrc # startup for all machines
  fi
fi

# dwm status
$HOME/.dotfiles/dwm/daemonstatus.sh &> /dev/null &

picom &> /dev/null &

webtest

feh --bg-scale ~/.dotfiles/dwm/wallpaper.jpg
