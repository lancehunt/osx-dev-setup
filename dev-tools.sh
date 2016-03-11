#!/bin/bash

echo "Installing dev-tools"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Aborting...Missing Homebrew!"
  exit 255
fi

# *** BEGIN SDK's & Runtimes ***
# install Go-lang
brew cask install go
export $GOPATH=$HOME/go

# install Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash


# *** BEGIN Dev Tools ***
# install Ack (grep for code) tool
brew install ack
# Update VIM to 7.4
brew reinstall vim --with-lua
# fix vimrc
cp /usr/local/share/vim/vim74/vimrc_example.vim ~/.vimrc
echo "set clipboard=unnamed" >> ~./.vimrc
# Install VSCode
brew cask install visual-studio-code
# Misc other tools
brew install openssh
brew install glide
brew cask install charles
brew cask install mou

