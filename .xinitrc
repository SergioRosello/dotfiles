#!/bin/sh
systemctl --user import-environment DISPLAY

WM="dwm"

case $WM in
  i3)
    ;;
  dwm)
    # Enter X session configuration commands here
    # Execute the command to set the background 
    # ~/.fehbg & 
    while true; do
      ~/.scripts/setroot.sh
      sleep 1m
    done &
    ;;
  *)
    $WM = "i3"
    ;;

esac

# Setup monitor configuration.
autorandr -c

exec dbus-launch $WM
