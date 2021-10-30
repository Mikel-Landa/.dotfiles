#!/bin/bash

# installs packages in pacman.txt and external.txt in the same directory

# pacman packages
sudo pacman -S --needed --noconfirm - < pacman.txt

# yay packages
yay -S --needed --noconfirm - < external.txt
