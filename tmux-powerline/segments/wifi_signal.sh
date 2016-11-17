SIGNAL_ICON=" "
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
  rssi=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I \
    | grep "agrCtlRSSI" | awk '{print $2}')
  noise=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I \
    | grep "agrCtlNoise" | awk '{print $2}')
  signal="$((rssi - noise))"

  if [ $signal -ge 40 ]; then
    echo "#[fg=colour118]$SIGNAL_ICON"
  elif [ $signal -ge 25 ]; then
    echo "#[fg=colour172]$SIGNAL_ICON"
  elif [ $signal -ge 10 ]; then
    echo "#[fg=colour196]$SIGNAL_ICON"
  else
    echo "#[fg=colour196]$NO_SIGNAL_ICON"
  fi
}
