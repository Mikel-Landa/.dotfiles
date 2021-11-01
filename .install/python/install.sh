!#/bin/bash

# all python dependencies for nvim
#start up 
python3 -m pip install --user --upgrade pynvim

# qtile on arch 
if pacman -Qi qtile > /dev/null ; then
  python -m pip install --user --upgrade psutil

fi
