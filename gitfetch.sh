#!/usr/bin/env bash

# fetches git repos
# meant to be run on startup with hcup

cd /home/colin/.dotfiles
git fetch &> /dev/null

for d in /home/colin/Projects/*; do
  cd $d
  git fetch &> /dev/null
done

cd ~
