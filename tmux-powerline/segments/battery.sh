TMUX_POWERLINE_SEG_BATTERY_TYPE_DEFAULT="percentage"

CHARGING_ICON=" "

generate_segmentrc() {
  read -d '' rccontents  << EORC
  export TMUX_POWERLINE_SEG_BATTERY_TYPE="${TMUX_POWERLINE_SEG_BATTERY_TYPE_DEFAULT}"
EORC
  echo "$rccontents"
}

run_segment() {
  if [ -z "$TMUX_POWERLINE_SEG_BATTERY_TYPE" ]; then
    export TMUX_POWERLINE_SEG_BATTERY_TYPE="${TMUX_POWERLINE_SEG_BATTERY_TYPE_DEFAULT}"
  fi

  battery_status=$(__battery_osx)
  [ -z "$battery_status" ] && return
  output="${battery_status}%"

  if [ -n "$output" ]; then
    echo "$output"
  fi
}

__battery_osx() {
  ioreg -c AppleSmartBattery -w0 | \
    grep -o '"[^"]*" = [^ ]*' | \
    sed -e 's/= //g' -e 's/"//g' | \
    sort | \
    while read key value; do
      case $key in
        "MaxCapacity")
          export maxcap=$value;;
        "CurrentCapacity")
          export curcap=$value;;
        "ExternalConnected")
          export extconnect=$value;;
      esac
      if [[ -n $maxcap && -n $curcap && -n $extconnect ]]; then
        charge=`pmset -g batt | grep -o "[0-9][0-9]*\%" | rev | cut -c 2- | rev`
        if [[ $charge -gt 75 ]]; then
          export NORMAL_ICON=" "
          echo -n "#[fg=colour118]"
        elif [[ $charge -gt 50 ]]; then
          export NORMAL_ICON=" "
          echo -n "#[fg=colour226]"
        elif [[ $charge -gt 25 ]]; then
          export NORMAL_ICON=" "
          echo -n "#[fg=colour202]"
        else
          export NORMAL_ICON=" "
          echo -n "#[fg=colour196]"
        fi
        if [[ "$extconnect" == "Yes" ]]; then
          echo "$CHARGING_ICON" "$charge"
        else
          echo "$NORMAL_ICON" "$charge"
        fi
        break
      fi
    done
  }
