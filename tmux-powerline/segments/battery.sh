CHARGING_ICON=" "

generate_segmentrc() {
  read -d '' rccontents  << EORC
EORC
  echo "$rccontents"
}

run_segment() {
  battery_status=$(__battery_osx)
  if [ -n "$battery_status" ]; then
    echo "$battery_status"
  fi
}

__battery_osx() {
  ioreg -c AppleSmartBattery -w0 | \
    grep -o '"[^"]*" = [^ ]*' | \
    sed -e 's/= //g' -e 's/"//g' | \
    sort | \
    while read key value; do
      case $key in
        "ExternalConnected")
          export extconnect=$value;;
      esac
      if [[ -n $extconnect ]]; then
        charge=`pmset -g batt | grep -o "[0-9][0-9]*\%" | rev | cut -c 2- | rev`
        if [[ $charge -gt 80 ]]; then
          export NORMAL_ICON=" "
          echo -n "#[fg=colour118]"
        elif [[ $charge -gt 60 ]]; then
          export NORMAL_ICON=" "
          echo -n "#[fg=colour226]"
        elif [[ $charge -gt 40 ]]; then
          export NORMAL_ICON=" "
          echo -n "#[fg=colour172]"
        elif [[ $charge -gt 20 ]]; then
          export NORMAL_ICON=" "
          echo -n "#[fg=colour160]"
        else
          export NORMAL_ICON=" "
          echo -n "#[fg=colour196]"
        fi
        if [[ "$extconnect" == "Yes" ]]; then
          echo "$CHARGING_ICON $charge%"
        else
          echo "$NORMAL_ICON $charge%"
        fi
        break
      fi
    done
  }
