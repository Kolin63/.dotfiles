#!/usr/bin/env bash

# colors!
RED="\033[0;31m"
CYAN="\033[0;36m"
NC="\033[0m"

# arguments: source path, target symlink path, sudo
function sym() {
  dir=""
  if [ -d $1 ] || [ -d $2 ]; then
    dir="-r"
  fi

  $3 diff $1 $2 &> /dev/null
  if [ $? -eq 0 ] || [ ! -e $2 ] && [ -e $1 ]; then
    printf "${RED}"
    if [ -e $2 ]; then
      $3 rm $2 $dir
    fi
    $3 ln -s $1 $2
    printf "${NC}Updated symlink for ${CYAN}$1 ${NC}to ${CYAN}$2\n"
  else
    if [ ! -e $1 ]; then
      printf "${RED}ERROR: ${CYAN}$1 ${RED}doesn't exist!\n"
    else
      printf "${RED}ERROR: ${CYAN}$1 ${RED}and ${CYAN}$2 ${RED}are not the same, resolve conflict!\n"
    fi
  fi

  printf "${NC}"
}

sym ~/.dotfiles/nvim ~/.config/nvim
sym ~/.dotfiles/dwm/dwm /usr/bin/dwm sudo
sym ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
sym ~/.dotfiles/bashrc ~/.bashrc
sym ~/.dotfiles/gh.yml ~/.config/gh/config.yml
sym ~/.dotfiles/git.conf ~/.gitconfig
sym ~/.dotfiles/grub.conf /etc/default/grub sudo
sym ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf
sym ~/.dotfiles/qutebrowser.py ~/.config/qutebrowser/config.py
sym ~/.dotfiles/gruvbox_qutebrowser.py ~/.config/qutebrowser/gruvbox.py
sym ~/.dotfiles/tmux.conf ~/.tmux.conf
sym ~/.dotfiles/vimrc ~/.vimrc
sym ~/.dotfiles/vimrc /root/.vimrc sudo
sym ~/.dotfiles/xsession ~/.xsession
