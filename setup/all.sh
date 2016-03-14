#!/bin/bash

echo "Performing a FULL setup!"

./osxprep.sh
./brew.sh
./osx.shdd
./apps.sh
./dev-tools.sh
./docker.sh
./aws.sh

echo "Done!"
