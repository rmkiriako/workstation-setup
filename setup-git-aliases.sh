#!/usr/bin/env bash

source ./banner-function.sh

banner "Setting up git aliases"

echo "Setting up 'git co'"
git config --global alias.co checkout

echo "Setting up 'git lola'"
git config --global alias.lola "log --graph --decorate --oneline --all"

echo "Setting up 'git st'"
git config --global alias.st status

banner "SETTING UP GIT ALIASES IS COMPLETE"

