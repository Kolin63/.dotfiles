# messages
greet_raw="Hello, Colin"
greet_raw_len="$(printf "$greet_raw" | wc -m)"
greet="\e[0;97m$greet_raw"

hora_raw="$(date)"
hora_raw_len="$(printf "$hora_raw" | wc -m)"
hora="\e[0;90m$hora_raw"

host_raw="$(whoami)@$(cat /etc/hostname)"
host_raw_len="$(printf "$host_raw" | wc -m)"
host="\e[0;90m$host_raw"

# padding
if [[ ! -z "$TMUX" ]]; then
  if [[ -z "$cols" ]]; then
    cols="$(tmux display-message -p "#{pane_width}")"
  fi
fi
if [[ -z "$cols" ]]; then
  cols="$(tput cols)"
fi
if [[ -z "$cols" ]]; then
  cols="$(stty size | awk '{print $2}')"
fi
if [[ -z "$cols" ]]; then
  cols="80"
fi

# to account for two spaces on either end
cols="$(( $cols - 4 ))"

pad_left_n=$(( $cols / 2 - $greet_raw_len - $hora_raw_len / 2 ))
pad_left="$(printf "%-${pad_left_n}s" " ")"

pad_right_n=$(( $cols / 2 - $hora_raw_len / 2 - $host_raw_len - 1 ))
pad_right="$(printf "%-${pad_right_n}s" " ")"

printf "\033[999;1H"
echo -e "\n  ${greet}${pad_left}${hora}${pad_right}${host}\e[0m  \n"
