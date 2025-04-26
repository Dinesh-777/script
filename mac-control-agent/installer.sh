#!/bin/bash

# URL for the raw GitHub files
SCRIPT_REPO="https://raw.githubusercontent.com/Dinesh-777/script/refs/heads/main/mac-control-agent"

# Directories where files will be placed
BIN_DIR="/usr/local/bin"
PLIST_DIR="$HOME/Library/LaunchAgents"

# File names
SYSTEM_SH="system.sh"
PLIST_FILE="com.apple.system.plist"
INSTALL_DIR="$HOME/mac-control-agent"

# Create installation directory
mkdir -p "$INSTALL_DIR"

# Download system.sh and com.apple.system.plist from GitHub
echo "Downloading system.sh..."
curl -sL "$SCRIPT_REPO/$SYSTEM_SH" -o "$INSTALL_DIR/$SYSTEM_SH"

echo "Downloading com.apple.system.plist..."
curl -sL "$SCRIPT_REPO/$PLIST_FILE" -o "$INSTALL_DIR/$PLIST_FILE"

# Move system.sh to /usr/local/bin for execution
echo "Installing system.sh to $BIN_DIR"
sudo mv "$INSTALL_DIR/$SYSTEM_SH" "$BIN_DIR/$SYSTEM_SH"

# Make system.sh executable
echo "Setting executable permission for system.sh"
sudo chmod +x "$BIN_DIR/$SYSTEM_SH"

# Move com.apple.system.plist to LaunchAgents
echo "Installing com.apple.system.plist to $PLIST_DIR"
mv "$INSTALL_DIR/$PLIST_FILE" "$PLIST_DIR/$PLIST_FILE"

# Load the plist (LaunchAgent)
echo "Loading the LaunchAgent..."
launchctl load -w "$PLIST_DIR/$PLIST_FILE"

# Clean up
rm -rf "$INSTALL_DIR"

echo "Installation complete. system.sh is running in the background and listening for commands."
