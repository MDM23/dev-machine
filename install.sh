#!/bin/bash

# Exit this script ony any error
set -e

# Ensure that the script is being run by root
if [ $EUID -ne 0 ]; then
  echo "This script must be run with root privileges!"
  exit 1;
fi

# Get the absolute path to the directory of this script
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# Update the cookbook
git --git-dir="$dir/.git" pull --rebase --autostash

# Execute chef-solo
chef-solo -c "$dir/solo.rb"
