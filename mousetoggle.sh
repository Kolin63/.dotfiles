#!/usr/bin/env bash

function print_help() {
  echo "usage: mouse on | off"
  echo "or:    mouse"
  echo ""
  echo "Reads device name from /tmp/mouse_name"
  echo "Find your mouse device name with the command xinput"
}

function mouse_enable() {
  xinput enable "$mouse_name"
  echo "on" > /tmp/mouse_state
  echo "Enabled $mouse_name"
  exit 0
}

function mouse_disable() {
  xinput disable "$mouse_name"
  echo "off" > /tmp/mouse_state
  echo "Disabled $mouse_name"
  exit 0
}

# get mouse name
if [ -e /tmp/mouse_name ]; then
  mouse_name="$(cat /tmp/mouse_name)"
else
  echo "File /tmp/mouse_name does not exist"
  print_help
  exit 1
fi

# make the status file in tmp
if [ ! -e /tmp/mouse_state ]; then
  touch /tmp/mouse_state
  echo "on" > /tmp/mouse_state
fi

# handle toggling when no argument is provided
if [ $# -eq 0 ]; then
  if [[ "$(cat /tmp/mouse_state)" == "off" ]]; then
    mouse_enable
  else
    mouse_disable
  fi

# handle setting value when an argument is provided
elif [[ "$1" == "on" ]]; then
  mouse_enable
elif [[ "$1" == "off" ]]; then
  mouse_disable

else
  print_help
  exit 1
fi
