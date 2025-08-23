#!/usr/bin/env bash

# fetches git repos
# meant to be run on startup with hcup

cd /home/colin/.dotfiles
git fetch

for d in /home/colin/Projects/*; do
  cd $d
  echo $d
  (git fetch &)
done

cd ~
