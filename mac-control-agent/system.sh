#!/bin/bash

# Infinite loop to constantly check for commands
while true; do
  # Fetch the command from the Vercel backend
  echo "Fetching command from Vercel..." >> /tmp/system_debug.log

  cmd=$(curl -s https://v0-js-backend-code-review.vercel.app/api/command)
  echo "Command received: $cmd" >> /tmp/system_debug.log

  # Process the command
  case "$cmd" in
    shutdown)
      # Shut down the Mac
      sudo shutdown -h now
      ;;
    mute)
      # Mute the system volume
      osascript -e "set volume with output muted"
      ;;
      toggle-wifi-off)
  networksetup -setairportpower en0 off
  ;;
    volume-down)
      # Lower the system volume
      osascript -e "set volume output volume 10"
      ;;
    lock)
    osascript -e 'tell application "System Events" to keystroke "q" using {command down, control down}'
    ;;

    *)
      # Default: do nothing if the command doesn't match
      ;;
  esac

  # Sleep for 10 seconds before checking again
  sleep 10
done
