#!/bin/bash

# Install Xcode command line tools.
xcode-select --install

# install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install brew-cask
brew update && brew cleanup && brew cask cleanup

# Configure Homebrew
brew doctor

# install cask
brew install cask
brew tap caskroom/versions

# *** BEGIN Configuring ***

# install Config Manager (for dotfiles)
brew install vcsh

# install Multiple Repository management tool
brew install mr

# *** SETUP DOTFILES 


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

# *** BEGIN SDK's & Runtimes ***
# install Go-lang
brew cask install go
export $GOPATH=$HOME/go
# install Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
# install Docker Toolbox
brew cask install dockertoolbox

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
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Open Finder at "~/" directory.
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Setup Git.
read -e -p "Enter your git username: " USERNAME
read -e -p "Enter your git email address: " EMAIL
git config --global user.name $USERNAME
git config --global user.email $EMAIL
ssh-keygen -t rsa -b 4096 -C $EMAIL
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

# Notify User of things that could not be installed
brew cask install remote-desktop-connection
echo "WARN: Must be installed via: https://itunes.apple.com/us/app/microsoft-remote-desktop/id715768417?mt=12"

