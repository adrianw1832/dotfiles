# LICENSE This code is not under the same license as the rest of the project as it's "stolen". It's cloned from https://github.com/richoH/dotfiles/blob/master/bin/battery and just some modifications are done so it works for my laptop. Check that URL for more recent versions.

TMUX_POWERLINE_SEG_BATTERY_TYPE_DEFAULT="percentage"

BATTERY_ICON=""

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
  output="${BATTERY_ICON} ${battery_status}%"

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
        "FullyCharged")
          export fully_charged=$value;;
      esac
      if [[ -n $maxcap && -n $curcap && -n $extconnect ]]; then
        if [[ "$curcap" == "$maxcap" || "$fully_charged" == "Yes" && $extconnect == "Yes"  ]]; then
          return
        fi
        charge=`pmset -g batt | grep -o "[0-9][0-9]*\%" | rev | cut -c 2- | rev`
        if [[ "$extconnect" == "Yes" ]]; then
          echo "$charge"
        else
          if [[ $charge -lt 50 ]]; then
            echo -n "#[fg=red]"
          fi
          echo "$charge"
        fi
        break
      fi
    done
  }
