#!/bin/bash

echo "Installing Docker"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Aborting...Missing Homebrew!"
  exit 255
fi

# install Docker Toolbox
brew cask install dockertoolbox

