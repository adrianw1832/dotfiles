SIGNAL_ICON=""
NO_SIGNAL_ICON=" "

generate_segmentrc() {
  read -d '' rccontents  << EORC
EORC
  echo "$rccontents"
}

run_segment() {
  wifi_status=$(__wifi_signal)
  if [ -n "$wifi_status" ]; then
    echo "$wifi_status"
  fi
}

__wifi_signal() {
  db=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I \
    | grep "agrCtlRSSI" | awk '{print $2}')
  signal="$((2 * ($db + 100)))"

  if [ $signal -gt 70 ]; then
    echo -n "#[fg=colour118]"
  elif [ $signal -gt 35 ]; then
    echo -n "#[fg=colour172]"
  else
    echo -n "#[fg=colour196]"
  fi

  if [ $signal -le 100 ] && [ $signal -ge 0 ]; then
    echo "$SIGNAL_ICON $signal%"
  else
    echo "#[fg=colour196]$NO_SIGNAL_ICON"
  fi
}
