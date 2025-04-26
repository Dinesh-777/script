#!/bin/bash

while true; do
  cmd=$(curl -s https://your-vercel-app.vercel.app/api/command)

  case "$cmd" in
    shutdown)
      sudo shutdown -h now
      ;;
    mute)
      osascript -e "set volume with output muted"
      ;;
    volume-down)
      osascript -e "set volume output volume 10"
      ;;
    lock)
      /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
      ;;
    *)
      # do nothing
      ;;
  esac

  sleep 10
done
