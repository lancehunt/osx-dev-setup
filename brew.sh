#!/bin/bash

# *** Install HomeBrew ***

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
	
# Check for Homebrew,
if test ! $(which brew); then
  # Install if we don't have it
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
		    
# Make sure we’re using the latest Homebrew.
brew update
		    
# Upgrade any already-installed formulae.
brew upgrade --all

# Configure Homebrew
brew doctor

# install cask
brew install cask
brew tap caskroom/versions


