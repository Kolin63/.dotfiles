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

mkdir $HOME/.config &> /dev/null
mkdir $HOME/.config/gh &> /dev/null
mkdir $HOME/.config/foot &> /dev/null
mkdir $HOME/.config/mako &> /dev/null

sym $HOME/.dotfiles/nvim                    $HOME/.config/nvim
sym $HOME/.dotfiles/emacs                   $HOME/.config/emacs
sym $HOME/.dotfiles/emacs.el                $HOME/.emacs.el
sym $HOME/.dotfiles/dwl/dwl                 /usr/bin/dwl sudo
sym $HOME/.dotfiles/bashrc                  $HOME/.bashrc
sym $HOME/.dotfiles/gh.yml                  $HOME/.config/gh/config.yml
sym $HOME/.dotfiles/git.conf                $HOME/.gitconfig
sym $HOME/.dotfiles/grub.conf               /etc/default/grub sudo
sym $HOME/.dotfiles/tmux.conf               $HOME/.tmux.conf
sym $HOME/.dotfiles/vimrc                   $HOME/.vimrc
sym $HOME/.dotfiles/vimrc                   /root/.vimrc sudo
sym $HOME/.dotfiles/ly-dm-lockscreen.ini    /etc/ly/config.ini sudo
sym $HOME/.dotfiles/ly-dm-lockscreen.ini    /etc/ly/config.ini sudo
sym $HOME/.dotfiles/foot.ini                $HOME/.config/foot/foot.ini
sym $HOME/.dotfiles/mako.conf               $HOME/.config/mako/config
sym $HOME/.dotfiles/keyd.conf               /etc/keyd/default.conf sudo
