TMUX_POWERLINE_SEG_TIME_FORMAT_DEFAULT="%H:%M"
TMUX_POWERLINE_SEG_DATE_FORMAT_DEFAULT="%F"

generate_segmentrc() {
  read -d '' rccontents  << EORC
  # date(1) format for the time. Americans might want to have "%I:%M %p".
  export TMUX_POWERLINE_SEG_TIME_FORMAT="${TMUX_POWERLINE_SEG_TIME_FORMAT_DEFAULT}"
  # date(1) format for the date. If you don't, for some reason, like ISO 8601 format you might want to have "%D" or "%m/%d/%Y".
  export TMUX_POWERLINE_SEG_DATE_FORMAT="${TMUX_POWERLINE_SEG_DATE_FORMAT_DEFAULT}"
EORC
  echo "$rccontents"
}

__process_settings() {
  if [ -z "$TMUX_POWERLINE_SEG_TIME_FORMAT" ]; then
    export TMUX_POWERLINE_SEG_TIME_FORMAT="${TMUX_POWERLINE_SEG_TIME_FORMAT_DEFAULT}"
  fi
  if [ -z "$TMUX_POWERLINE_SEG_DATE_FORMAT" ]; then
    export TMUX_POWERLINE_SEG_DATE_FORMAT="${TMUX_POWERLINE_SEG_DATE_FORMAT_DEFAULT}"
  fi
}

run_segment() {
  __process_settings

	day=$(date +"%a")
  time=$(date +"$TMUX_POWERLINE_SEG_TIME_FORMAT")
  date=$(date +"$TMUX_POWERLINE_SEG_DATE_FORMAT")

  echo "$day "  "$time "  "$date"
  return 0
}
