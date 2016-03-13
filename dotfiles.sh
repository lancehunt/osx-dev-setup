#!/bin/bash

echo "Installing Standard  DotFiles"

# Check for Homebrew,
# Warn if we don't have it
if test ! $(which brew); then
  echo "Aborting...Missing Homebrew!"
  exit 255
fi

# install Config Manager (for dotfiles)
brew install vcsh

# install Multiple Repository management tool
brew install mr


# TODO: Setup DotFiles
