#!/bin/bash

INFO=" "

function print_networks {
  INFO+="$(iw dev wlp0s20f3 info | grep ssid | awk '{print $2}')"
}

function print_date {
  INFO+=$(date +"%a %d/%m/%y")
  INFO+=$(date +" %H:%M")
}

function print_battery {
  INFO+=" $(cat /sys/class/power_supply/BAT0/capacity)%"
}

function print_separator {
  INFO+=" | "
}

print_battery
print_separator
print_networks
print_separator
print_date
xsetroot -name "$INFO"
