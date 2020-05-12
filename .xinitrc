#!/bin/sh
systemctl --user import-environment DISPLAY

WM="dwm"

case $WM in
  i3)
    ;;
  dwm)
    # Enter X session configuration commands here
    # Execute the command to set the background 
    ~/.fehbg & 
    while true; do
      INFO=""
      INFO+=$(date +"%a %d/%m/%y")
      INFO+=$(date +" %H:%M")
      xsetroot -name "$INFO"
      sleep 1m
    done &
    ;;
  *)
    $WM = "i3"
    ;;

esac

# Setup monitor configuration.
autorandr -c

exec $WM
