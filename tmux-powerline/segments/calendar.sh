# date(1) format for the time. Americans might want to have "%I:%M %p".
TMUX_POWERLINE_SEG_TIME_FORMAT_DEFAULT="%H:%M"
# date(1) format for the date. If you don't, for some reason, like ISO 8601 format you might want to have "%D" or "%m/%d/%Y".
TMUX_POWERLINE_SEG_DATE_FORMAT_DEFAULT="%d-%m-%Y"

generate_segmentrc() {
  read -d '' rccontents  << EORC
EORC
  echo "$rccontents"
}

run_segment() {
  day=$(date +"%a")
  time=$(date +"$TMUX_POWERLINE_SEG_TIME_FORMAT_DEFAULT")
  date=$(date +"$TMUX_POWERLINE_SEG_DATE_FORMAT_DEFAULT")

  echo "$day"  "$time"  "$date"
}
