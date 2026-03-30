#!/usr/bin/env bash

if [[ $# -ne 5 ]]; then
  echo "Usage: $0 <window width> <session name> <cwd> <active window index> <window index list>"
  exit 1
fi

width=$1
session_name_raw=$2
dir=$3
active_window_index=$4
window_index_list=$5

# session name
session_name_len="$(printf "$session_name_raw" | wc -m)"
session_name="#[fg=orange]$session_name_raw#[fg=default]"

# tags / window status
tags=""
tags_raw_len=0

for i in $window_index_list; do
  if [[ "$i" == "$active_window_index" ]]; then
    tags="$tags#[bg=blue] $i #[bg=default]"
  else
    tags="$tags $i "
  fi
  tags_raw_len="$(($tags_raw_len + $(printf "$i" | wc -m) + 2))"
done

# git block
git_char_working=""
git_char_staging=""
git_char_stash=""
git_char_push="↑"
git_char_pull="↓"
git_char_up_to_date="●"
git_char_untracked="?"
git_char_modified="~"
git_char_staged="+"

git_status_raw="$(git -C $dir status -sbvv --show-stash --porcelain=v2 --ahead-behind)"

git_branch="$(echo "$git_status_raw" | grep -o --color=NEVER "^# branch\.head .*$" | awk '{print($3)}')"

git_modified_n=0
git_staged_n=0
git_untracked_n=$(echo "$git_status_raw" | grep -o --color=NEVER "^?.*$" | wc -l)

git_xy=$(echo "$git_status_raw" | grep -o --color=NEVER "^[^#?].*$" | awk '{print($2)}' | tr "\n" " ")
for i in $git_xy; do
  if [[ "${i:1:1}" != "." ]]; then
    git_modified_n=$(( $git_modified_n + 1))
  fi
  if [[ "${i:0:1}" != "." ]]; then
    git_staged_n=$(( $git_staged_n + 1))
  fi
done

git_ab_raw=$(echo "$git_status_raw" | grep -o --color=NEVER "^# branch.ab .*$" | awk '{print($3 $4)}' | tr "+-" " ")
git_ahead=$(echo "$git_ab_raw" | awk '{print($1)}')
git_behind=$(echo "$git_ab_raw" | awk '{print($2)}')

git_stash_n=$(echo "$git_status_raw" | grep -o --color=NEVER "^# stash .*$" | awk '{print($3)}')

git_ab=""
if [[ $git_ahead -gt 0 ]]; then
  git_ab="${git_ab}${git_char_push}$git_ahead "
fi
if [[ $git_behind -gt 0 ]]; then
  git_ab="${git_ab}${git_char_pull}$git_behind "
fi
if [[ $git_ahead -eq 0 && $git_behind -eq 0 ]]; then
  git_ab="$git_char_up_to_date "
fi

git_working=""
if [[ $git_modified_n -gt 0 || $git_untracked_n -gt 0 ]]; then
  git_working="$git_char_working "
fi
if [[ $git_untracked_n -gt 0 ]]; then
  git_working="${git_working}${git_char_untracked}$git_untracked_n "
fi
if [[ $git_modified_n -gt 0 ]]; then
  git_working="${git_working}${git_char_modified}$git_modified_n "
fi

git_staging=""
if [[ $git_staged_n -gt 0 ]]; then
  if [[ $git_modified_n -gt 0 || $git_untracked_n -gt 0 ]]; then
    git_staging="| "
  fi
  git_staging="${git_staging}$git_char_staging ${git_char_staged}$git_staged_n "
fi

git_stash=""
if [[ $git_stash_n -gt 0 ]]; then
  git_stash="$git_char_stash $git_stash_n "
fi

git_bg="#98971a"
if [[ $git_modified_n -gt 0 || $git_untracked_n -gt 0 || $git_staged_n -gt 0 ]]; then
  git_bg="#ff9248"
elif [[ $git_behind -gt 0 || $git_ahead -gt 0 ]]; then
  git_bg="#b388ff"
elif [[ $git_behind -gt 0 && $git_ahead -gt 0 ]]; then
  git_bg="#ff4500"
fi

git_raw="$git_branch ${git_ab}${git_working}${git_staging}${git_stash}"
git_raw="$(echo $git_raw)"
git_raw_len="$(printf "$git_raw" | wc -m)"
git="#[bg=$git_bg, fg=#282828] $git_raw #[bg=default, fg=default]"

# calculate padding
pad_left_n="$(( $width / 2 - $git_raw_len / 2 - $tags_raw_len ))"
pad_left="$(printf "%-${pad_left_n}s" " ")"

pad_right_n="$(( $width - $tags_raw_len - $pad_left_n - $git_raw_len - $session_name_len - 2))"
pad_right="$(printf "%-${pad_right_n}s" " ")"

# final output
echo "${tags}${pad_left}${git}${pad_right}${session_name}"
