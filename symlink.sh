#!/usr/bin/env bash

# colors!
RED="\033[0;31m"
CYAN="\033[0;36m"
NC="\033[0m"

# arguments: source path, target symlink path, sudo
sym()
{
  dir=""
  if [ -d $1 ] || [ -d $2 ]; then
    dir="-r"
  fi

  $3 diff $1 $2 &> /dev/null
  if ([ $? -eq 0 ] || [ ! -e $2 ]) && [ -e $1 ]; then
    $3 rm $2 $dir &> /dev/null
    $3 ln -s $1 $2
    printf "${NC}Updated symlink for ${CYAN}$1 ${NC}to ${CYAN}$2\n"
  else
    if [ ! -e $1 ]; then
      printf "${RED}ERROR: ${CYAN}$1 ${RED}doesn't exist!\n"
    else
      printf "${RED}ERROR: ${CYAN}$1 ${RED}and ${CYAN}$2 ${RED}are not the same, resolve conflict!\n"
    fi
  fi
}

sym ~/.dotfiles/gh ~/.config/gh
sym ~/.dotfiles/nvim ~/.config/nvim
sym ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
sym ~/.dotfiles/bashrc ~/.bashrc
sym ~/.dotfiles/git.conf ~/.gitconfig
sym ~/.dotfiles/grub.conf /etc/default/grub sudo
sym ~/.dotfiles/i3.conf ~/.config/i3/config
sym ~/.dotfiles/i3status.conf ~/.config/i3status/config
sym ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf
sym ~/.dotfiles/tmux.conf ~/.tmux.conf
sym ~/.dotfiles/vimrc ~/.vimrc
sym ~/.dotfiles/vimrc /root/.vimrc sudo
