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

nohup awww-daemon > /dev/null
awww img -t none $HOME/.dotfiles/dwl/wallpaper.jpg

$HOME/.dotfiles/wsbashrc
