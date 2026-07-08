#!/usr/bin/env bash
# Polybar battery script

battery="BAT0"
cap=$(cat /sys/class/power_supply/$battery/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/$battery/status 2>/dev/null)

[ -z "$cap" ] && { echo "⚠"; exit 0; }

if [ "$status" = "Charging" ] || [ "$status" = "Full" ]; then
  color="#b8bb26"
  if [ "$cap" -ge 90 ]; then icon="󰂅"
  elif [ "$cap" -ge 75 ]; then icon="󰂋"
  elif [ "$cap" -ge 50 ]; then icon="󰂊"
  else icon="󰢜"; fi
  echo "%{F$color}$icon $cap%{F-}"
  exit 0
fi

if [ "$cap" -le 10 ]; then
  color="#fb4934"
  flash_file="/tmp/polybar-bat-flash"
  if [ -f "$flash_file" ]; then
    rm "$flash_file"
    icon="󰂎"
  else
    touch "$flash_file"
    icon="󰁺"
  fi
  echo "%{F$color}$icon $cap%{F-}"
elif [ "$cap" -le 30 ]; then
  echo "%{F#d79921}󰁼 $cap%{F-}"
else
  echo "󰁹 $cap"
fi
