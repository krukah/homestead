#!/usr/bin/env bash
# macOS system preferences. Build this incrementally — each time you tweak a
# System Settings panel and want it on every machine, capture the `defaults`
# command here.
#
# Discovery workflow:
#   defaults read > /tmp/before.txt
#   <click around in System Settings>
#   defaults read > /tmp/after.txt
#   diff /tmp/before.txt /tmp/after.txt
set -euo pipefail

echo "==> Finder"
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "==> Keyboard"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "==> Screenshots"
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture location "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture type -string "png"

# Touch ID for sudo is set up in bootstrap.sh (it needs to happen before the
# cask installs, not here), so it's intentionally not repeated in this file.

echo "==> Restarting affected services"
killall Finder Dock SystemUIServer 2>/dev/null || true

echo "==> done. Some changes require logout to take effect."
