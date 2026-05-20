# cow
cow_og="$(bash $HOME/.dotfiles/scripts/wisecow)"
cow_lines_n=$(echo "$cow_og" | wc -l)
cow_longest=0
for (( i=1; i<=$cow_lines_n; ++i )); do
  cow_line="$(echo "$cow_og" | head -$i | tail -1)"
  cow_line_len="$(echo "$cow_line" | wc -m)"
  if [[ "$cow_line_len" -gt "$cow_longest" ]]; then
    cow_longest="$cow_line_len"
  fi
done

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
  exit 0
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

cow_pad_left_n=$(( $cols / 2 - $cow_longest / 2 ))
cow_pad_left="$(printf "%-${cow_pad_left_n}s" " ")"
# apply cow pad to text
cow=""
for (( i=1; i<=$cow_lines_n; ++i )); do
  cow_line="$(echo "$cow_og" | head -$i | tail -1)"
  cow_line_padded="${cow_pad_left}${cow_line}"
  cow="${cow}${cow_line_padded} \n"
done

pad_left_n=$(( $cols / 2 - $greet_raw_len - $hora_raw_len / 2 ))
pad_left="$(printf "%-${pad_left_n}s" " ")"

pad_right_n=$(( $cols / 2 - $hora_raw_len / 2 - $host_raw_len - 1 ))
pad_right="$(printf "%-${pad_right_n}s" " ")"

echo -e "\n${cow}\n\n\n\n  ${greet}${pad_left}${hora}${pad_right}${host}\e[0m  \n"
