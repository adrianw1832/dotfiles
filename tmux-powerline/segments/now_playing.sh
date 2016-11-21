# Print current playing song in spotify
TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN="40"
TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR=""

generate_segmentrc() {
  read -d '' rccontents  << EORC
EORC
  echo "$rccontents"
}

run_segment() {
  np=$($TMUX_POWERLINE_DIR_USER_SEGMENTS/np_spotify_mac.script)

  if [ -n "$np" ]; then
    np=${np:0:TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN}
    echo "$TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR ${np}"
  fi
}
