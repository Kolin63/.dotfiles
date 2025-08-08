#!/usr/bin/env bash
# This i3status wrapper allows to add custom information in any position of the statusline
# It was developed for i3bar (JSON format)

# The idea is to define "holder" modules in i3status config and then replace them

# In order to make this example work you need to add
# order += "tztime holder__hey_man"
# and 
# tztime holder__hey_man {
#        format = "holder__hey_man"
# }
# in i3staus config 

# You can easily add multiple custom modules using additional "holders"

function update_holder {

  local instance="$1"
  local replacement="$2"
  echo "$json_array" | jq --argjson arg_j "$replacement" "(.[] | (select(.instance==\"$instance\"))) |= \$arg_j" 
}

function remove_holder {

  local instance="$1"
  echo "$json_array" | jq "del(.[] | (select(.instance==\"$instance\")))"
}

function spotify {
  # Get the current playing song metadata from Spotify using dbus
  SPOTIFY_METADATA=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
    string:"org.mpris.MediaPlayer2.Player" string:"Metadata")

  # Extract the artist and title using grep and cut
  ARTIST=$(echo "$SPOTIFY_METADATA" | grep -A 2 "xesam:artist" | tail -1 | cut -d '"' -f 2)
  TITLE=$(echo "$SPOTIFY_METADATA" | grep -A 1 "xesam:title" | tail -1 | cut -d '"' -f 2)

  local json='{ "full_text": " '$TITLE' - '$ARTIST'", "color": "#1DB954" }'

  json_array=$(update_holder holder__spotify "$json")
}

i3status | (read line; echo "$line"; read line ; echo "$line" ; read line ; echo "$line" ; while true
do
  read line
  json_array="$(echo $line | sed -e 's/^,//')"
  spotify
  echo ",$json_array" 
done)
