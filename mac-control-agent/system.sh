#!/bin/bash

# Infinite loop to constantly check for commands
while true; do
  # Fetch the command from the Vercel backend
  cmd=$(curl -s https://your-vercel-app.vercel.app/api/command)

  case "$cmd" in
    shutdown)
      # Shut down the Mac
      sudo shutdown -h now
      ;;
    mute)
      # Mute the system volume
      osascript -e "set volume with output muted"
      ;;
    volume-down)
      # Lower the system volume
      osascript -e "set volume output volume 10"
      ;;
    lock)
      # Lock the screen
      /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
      ;;
    *)
      # Default: do nothing if the command doesn't match
      ;;
  esac

  # Sleep for 10 seconds before checking again
  sleep 10
done
