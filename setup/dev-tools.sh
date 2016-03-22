#!/bin/bash

echo "Installing dev-tools"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Aborting...Missing Homebrew!"
  exit 255
fi

sudo -v

# *** BEGIN SDK's & Runtimes ***
# install Go-lang
brew cask install go
export $GOPATH=$HOME/go

# install Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
nvm install v4.4.0
npm install -g npm



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
# Install Atom (still deciding which I prefer)
brew cask install atom
# Misc other tools
brew install openssl --with-engine --with-cast
#brew install openssh@6.8 --with-keychain-support
brew install glide
brew cask install charles
brew cask install eou
brew install jq
brew cask install git
brew cask install tcl

# *** BEGIN DNX Install ***
brew tap aspnet/dnx
brew update
brew install dnvm
source dnvm.sh
dnvm upgrade

# Install ASPNET 5 tools
npm install -g generator-aspnet
npm install -g yo gulp

source ~/.bashrc

