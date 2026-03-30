#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <active window index> <is pane active>"
  exit 1
fi

dir=$1
active=$2
bgcolor="white"

if [[ "$active" == "1" ]]; then
  bgcolor="green"
fi

path_raw="$(echo "$dir" | awk '{gsub(/\/home\/[^\/]+/, "~");}1')"
path="#[bg=$bgcolor, fg=black] $path_raw #[bg=default, fg=default]"

echo "$path"
