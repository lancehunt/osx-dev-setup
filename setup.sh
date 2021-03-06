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
        if [ $ARG == "bootstrap" ]; then
            echo ""
            echo "------------------------------"
            echo "Cloning the osx-dev-setup repo to your local machine."
            echo "------------------------------"
            echo ""
            cd ~ && git init; git remote add origin https://github.com/lancehunt/osx-dev-setup.git; git fetch; git reset --hard origin/master
        fi
        if [ $ARG == "all" ]; then
            echo "------------------------------"
            echo "Attempting Full Setup!"
            echo "------------------------------"
	    ./all.sh
        fi
        if [ $ARG != "all" ]; then
            echo "------------------------------"
            echo "Running ${ARG} setup"
            echo "------------------------------"
            echo ""
          if [ ! -f setup/${ARG}.sh ]; then
              echo "Aborting! Missing setup command: ${ARG}"
              exit
          fi
          eval setup/${ARG}.sh
        fi
    done

    echo "------------------------------"
    echo "Completed running Setup, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runInit $@
fi;

unset runInit;
