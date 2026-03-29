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

# hides the mouse after 3 seconds of inactivity
unclutter -idle 3 &> /dev/null &

keyd-application-mapper -d

picom &> /dev/null &

webtest

feh --bg-scale ~/.dotfiles/dwm/wallpaper.jpg

$HOME/.dotfiles/xlsbashrc &
