#!/usr/bin/env bash
# Polybar network speed script
# Shows current download/upload speed

interface=$(nmcli -t -f DEVICE,TYPE con show --active 2>/dev/null | grep -E 'wifi|ethernet' | head -1 | cut -d: -f1)

if [ -z "$interface" ]; then
  echo "󰣼  ↓— ↑—"
  exit 0
fi

# Get initial values
read rx1 tx1 <<< $(awk -v iface="$interface" '$1 ~ iface":" {gsub(/:/,""); print $2, $10}' /proc/net/dev)
sleep 1
read rx2 tx2 <<< $(awk -v iface="$interface" '$1 ~ iface":" {gsub(/:/,""); print $2, $10}' /proc/net/dev)

# Calculate speeds in bytes/s
rx_bytes=$((rx2 - rx1))
tx_bytes=$((tx2 - tx1))

# Convert to human-readable
format_speed() {
  local bytes=$1
  if [ $bytes -ge 1048576 ]; then
    echo "$(echo "scale=1; $bytes / 1048576" | bc) MB/s"
  elif [ $bytes -ge 1024 ]; then
    echo "$(echo "scale=1; $bytes / 1024" | bc) KB/s"
  else
    echo "${bytes} B/s"
  fi
}

dl=$(format_speed $rx_bytes)
ul=$(format_speed $tx_bytes)

echo "↓${dl} ↑${ul}"
