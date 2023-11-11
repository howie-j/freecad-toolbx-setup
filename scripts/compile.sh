#!/bin/bash


#######################################
#           compile freecad           #
#######################################


cd "$HOME"/git/fc_build || exit
cmake ../fc || exit
make -j"$(nproc)" || exit
echo "FreeCAD compiled successfully!" && exit