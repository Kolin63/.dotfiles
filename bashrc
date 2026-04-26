#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [ -e /bin/lsd ]; then
  alias ls="lsd"
  alias tree="lsd --tree"
fi

export EDITOR="nvim"
export MANPAGER="less"
which vi &> /dev/null && export EDITOR="vi"
which vim &> /dev/null && export EDITOR="vim"
which nvim &> /dev/null && export EDITOR="nvim" && export MANPAGER="nvim +Man!"

alias v="$EDITOR"

alias c="clear"

alias ts="tmux-sessionizer"

alias windows="sudo grub-reboot 4; sudo reboot now"

alias copy="xclip -selection clipboard"

alias yay="yay --answerclean None --answerdiff None"

alias open="xdg-open"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/scripts"
export PATH="$PATH:$HOME/.local/share/applications"
export PATH="$PATH:$HOME/.local/kitty.app/bin"
export PATH="$PATH:$HOME/.dotfiles/scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/.local/share/emsdk"
export PATH="$PATH:$HOME/.local/share/emsdk/upstream/emscripten"

export XDG_CONFIG_HOME="$HOME/.config"

export PRINTER="HL2270DW"
export LPDEST="HL2270DW"

export BC_ENV_ARGS="$HOME/.dotfiles/bc"

export TZ="America/New_York"

export MC="$HOME/.local/share/PandoraLauncher/instances"
export END="$HOME/.local/share/endian"

# java stuff
export CLASSPATH=build/classes/java/main/
alias gradlew="bash gradlew"

export EMSDK=$HOME/.local/share/emsdk
export EMSDK_NODE=$HOME/.local/share/emsdk/node/22.16.0_64bit/bin/node

# this is a little hack to stop ctrl-d from closing the terminal
export IGNOREEOF=32767

if [ -e ~/.dotfiles/lbashrc ]; then
  source ~/.dotfiles/lbashrc
fi

if [ ! -e /tmp/.sbashrcWasRan ]; then
  touch /tmp/.sbashrcWasRan
  if [ -e ~/.dotfiles/lsbashrc ]; then
    source ~/.dotfiles/lsbashrc # for local startup
  fi
  if [ -e ~/.dotfiles/sbashrc ]; then
    source ~/.dotfiles/sbashrc # startup for all machines
  fi
fi

# python stuff
source venv/bin/activate &> /dev/null

. $HOME/.deno/env &> /dev/null

clear() {
    command clear
    printf '\033[999;1H'
}

printf "\033[999;1H"
bash "$HOME/.dotfiles/scripts/bashwelcome.sh"

[ -e "$HOME/.local/bin/oh-my-posh" ] && eval "$(oh-my-posh init bash --config '~/.dotfiles/colin.omp.json')" &> /dev/null


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source /home/colin/.local/share/bash-completion/completions/deno.bash &> /dev/null
