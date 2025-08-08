#!/usr/bin/env bash

# colors!
RED="\033[0;31m"
CYAN="\033[0;36m"
BRIGHTBLACK="\033[0;90m"
NC="\033[0m"

if [ -d /mnt/ADVANTAGE2/active ]; then
  src=~/.dotfiles/advantage.txt
  dest=/mnt/ADVANTAGE2/active/qwerty.txt

  if [ -e $src ]; then
    printf "${RED}"
    if [ -e $dest ]; then
      sudo rm $dest
    fi
    sudo cp $src $dest
    printf "${NC}Updated contents of ${CYAN}$dest ${NC}to ${CYAN}$src\n"
    printf "\n${BRIGHTBLACK}$(sudo cat $dest)\n\n"
  else
    printf "${RED}ERROR: ${CYAN}$src ${RED}doesn't exist!\n"
  fi
else
  printf "${RED}ERROR: Device not mounted at /mnt/ADVANTAGE2"
fi
