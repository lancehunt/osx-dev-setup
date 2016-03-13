#!/bin/bash

echo "Installing OSX Defaults"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Aborting...Missing Homebrew!"
  exit 255
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# *** BEGIN Settings ***
#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02
#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12
#Show the ~/Library folder
chflags nohidden ~/Library
#Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

# Enable "Tap to Click".
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Invert scrolling direction.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Open Finder at "~/" directory.
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

