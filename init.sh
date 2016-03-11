#!/usr/bin/env bash

# Stolen from: https://github.com/donnemartin/dev-setup

function runInit() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ $ARG == "bootstrap" ] || [ $ARG == "all" ]; then
            echo ""
            echo "------------------------------"
            echo "Syncing the dev-setup repo to your local machine."
            echo "------------------------------"
            echo ""
            cd ~ && curl -#L https://github.com/lancehunt/osx-dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
        fi
        if [ $ARG == "osxprep" ] || [ $ARG == "all" ]; then
            # Run the osxprep.sh Script
            echo ""
            echo "------------------------------"
            echo "Updating OSX and installing Xcode command line tools"
            echo "------------------------------"
            echo ""
            ./osxprep.sh
        fi
        if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
            # Run the brew.sh Script
            # For a full listing of installed formulae and apps, refer to
            # the commented brew.sh source file directly and tweak it to
            # suit your needs.
            echo ""
            echo "------------------------------"
            echo "Installing Homebrew along with some common formulae and apps."
            echo "This might awhile to complete, as some formulae need to be installed from source."
            echo "------------------------------"
            echo ""
            ./brew.sh
        fi
        if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
            # Run the osx.sh Script
            # I strongly suggest you read through the commented osx.sh
            # source file and tweak any settings based on your personal
            # preferences. The script defaults are intended for you to
            # customize. For example, if you are not running an SSD you
            # might want to change some of the settings listed in the
            # SSD section.
            echo ""
            echo "------------------------------"
            echo "Setting sensible OSX defaults."
            echo "------------------------------"
            echo ""
            ./osx.sh
        fi
        if [ $ARG == "apps" ] || [ $ARG == "all" ]; then
            # Run the apps.sh Script
            echo "------------------------------"
            echo "Setting up Apps."
            echo "------------------------------"
            echo ""
            ./apps.sh
        fi         
       	if [ $ARG == "dev-tools" ] || [ $ARG == "all" ]; then
            # Run the dev-tools.sh Script
            echo "------------------------------"
            echo "Setting up Dev Tools."
            echo "------------------------------"
            echo ""
            ./dev-tools.sh
        fi       
       	if [ $ARG == "docker" ] || [ $ARG == "all" ]; then
            # Run the docker.sh Script
            echo "------------------------------"
            echo "Setting up Docker environment."
            echo "------------------------------"
            echo ""
            ./docker.sh
        fi
         if [ $ARG == "aws" ] || [ $ARG == "all" ]; then
            # Run the aws.sh Script
            echo "------------------------------"
            echo "Setting up AWS development environment."
            echo "------------------------------"
            echo ""
            ./aws.sh
        fi      
       	if [ $ARG == "dotfiles" ] || [ $ARG == "all" ]; then
            # Run the dotfiles.sh Script
            echo "------------------------------"
            echo "Setting up DotFiles."
            echo "------------------------------"
            echo ""
            ./dotfiles.sh
        fi

    done

    echo "------------------------------"
    echo "Completed running Init, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runInit $@
fi;

unset runInit;