#!/bin/bash

echo "Updating pacman package list..."
# checking for ripgrep
if ! pacman -Qs ripgrep > /dev/null ; then
  echo "We need ripgrep for this script. Interrupt the script if this is not your intention"
  echo "Installing ripgrep..."
  sudo pacman -S ripgrep
fi
 
expac -H M "%-20n" $(comm -23 <(pacman -Qqent | sort) <({ pacman -Qqg base-devel; expac -l '\n' '%E' base; } | sort | uniq)) | sort -n | rg -o '^[^\s]+' > pacman.txt
echo "Updating external package list..."
pacman -Qm | rg -o '^[^\s]+' > external.txt
