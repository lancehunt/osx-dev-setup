#!/bin/bash

echo "Installing apps via Homebrew and Cask"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Aborting...Missing Homebrew!"
  exit 255
fi

# *** BEGIN Apps ***
brew cask install iterm2
brew cask install dropbox 
brew cask install slack
brew cask install gitter
brew cask install spectacle
brew cask install 1password
brew cask install google-chrome
brew cask install google-hangouts
brew cask install caffeine
brew cask install imageoptim
brew cask install snagit
brew cask install screenhero
brew install htop

# Notify User of things that could not be installed
brew cask install remote-desktop-connection
echo "WARN: Must be installed via: https://itunes.apple.com/us/app/microsoft-remote-desktop/id715768417?mt=12"

