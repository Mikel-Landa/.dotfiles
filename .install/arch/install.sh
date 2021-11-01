#!/bin/bash

# installs packages in pacman.txt and external.txt in the same directory

# pacman packages
sudo pacman -S --needed --noconfirm - < pacman.txt

# yay packages
if ! command -v yay &> /dev/null ; then
    echo "yay could not be found. You need to install it to continue"; exit 1;
fi

yay -S --needed --noconfirm - < external.txt
