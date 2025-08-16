#!/usr/bin/env bash

function print_help() {
  echo "usage: mouse on | off"
  echo ""
  echo "Reads device name from \$MOUSE"
  echo "Find your mouse device name with the command xinput"
}

if [ $# -ne 1 ]; then
  print_help
  exit 1
fi

if [[ "$1" == "on" ]]; then
  xinput enable "$MOUSE"
  echo "Enabled $MOUSE"
  exit 0
elif [[ "$1" == "off" ]]; then
  xinput disable "$MOUSE"
  echo "Disabled $MOUSE"
  exit 0
else
  exit 1
fi
