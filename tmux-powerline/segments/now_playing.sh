# Print current playing song in your music player of choice.

source "${TMUX_POWERLINE_DIR_LIB}/text_roll.sh"

TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN_DEFAULT="40"
TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD_DEFAULT="trim"
TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED_DEFAULT="2"
TMUX_POWERLINE_SEG_NOW_PLAYING_MPD_SIMPLE_FORMAT_DEFAULT="%artist% - %title%"
TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR_DEFAULT="♫"

generate_segmentrc() {
  read -d '' rccontents  << EORC
  # Music player to use. Can be any of {audacious, banshee, cmus, itunes, lastfm, mocp, mpd, mpd_simple, pithos, rdio, rhythmbox, spotify, spotify_wine, file}.
  export TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER=""
  # File to be read in case the song is being read from a file
  export TMUX_POWERLINE_SEG_NOW_PLAYING_FILE_NAME=""
  # Maximum output length.
  export TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN="${TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN_DEFAULT}"
  # How to handle too long strings. Can be {trim, roll}.
  export TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD="${TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD_DEFAULT}"
  # Charcters per second to roll if rolling trim method is used.
  export TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED="${TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED_DEFAULT}"
  # Fancy char to display before now playing track
  export TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR="${TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR_DEFAULT}"
EORC
  echo "$rccontents"
}

run_segment() {
  __process_settings

  if [ -z "$TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER" ]; then
    return 1
  fi

  local np
  local app_exit
  IFS=',' read -ra PLAYERS <<< "$TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER"
  for i in "${PLAYERS[@]}"; do
    case "$i" in
      "spotify")  np=$(__np_spotify) ;;
      *)
        echo "Unknown music player type [${TMUX_POWERLINE_SEG_NOW_PLAYING_MUSIC_PLAYER}]";
        return 1
    esac
    app_exit="$?"
    [ -n "$np" ] && break
  done

  local exitcode="$app_exit"
  if [ "${exitcode}" -ne 0 ]; then
    return ${exitcode}
  fi
  if [ -n "$np" ]; then
    case "$TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD" in
      "roll")
        np=$(roll_text "${np}" ${TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN} ${TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED_DEFAULT})
        ;;
      "trim")
        np=${np:0:TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN}
        ;;
    esac
    echo "${TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR} ${np}"
  fi
  return 0
}

__process_settings() {
  if [ -z "$TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN" ]; then
    export TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN="${TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN_DEFAULT}"
  fi
  if [ -z "$TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD" ]; then
    export TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD="${TMUX_POWERLINE_SEG_NOW_PLAYING_TRIM_METHOD_DEFAULT}"
  fi
  if [ -z "$TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED" ]; then
    export TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED="${TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED_DEFAULT}"
  fi
  if [ -z "$TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR" ]; then
    export TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR="${TMUX_POWERLINE_SEG_NOW_PLAYING_NOTE_CHAR_DEFAULT}"
  fi
}

__np_spotify() {
  if shell_is_linux; then
    metadata=$(dbus-send --reply-timeout=42 --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2>/dev/null)
    if [ "$?" -eq 0 ] && [ -n "$metadata" ]; then
      # TODO how do one express this with dbus-send? It works with qdbus but the problem is that it's probably not as common as dbus-send.
      state=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player PlaybackStatus)
      if [[ $state == "Playing" ]]; then
        artist=$(echo "$metadata" | grep -PA2 "string\s\"xesam:artist\"" | tail -1 | grep -Po "(?<=\").*(?=\")")
        track=$(echo "$metadata" | grep -PA1 "string\s\"xesam:title\"" | tail -1 | grep -Po "(?<=\").*(?=\")")
        np=$(echo "${artist} - ${track}")
      fi
    fi
  elif shell_is_osx; then
    np=$(${TMUX_POWERLINE_DIR_USER_SEGMENTS}/np_spotify_mac.script)
  fi
  echo "$np"
}
