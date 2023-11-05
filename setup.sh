#!/bin/bash


############################################################
#           freecad development setup for fedora           #
############################################################


# create directories and clone freecad
mkdir -p "$HOME"/git/fc_build
git clone https://github.com/howie-j/freecad.git "$HOME"/git/fc


# create and setup a toolbox
toolbox create -y -r38 freecad-toolbox
toolbox run -c freecad-toolbox sh ./scripts/fedora_38_dependencies.sh || echo "freecad dependencies installation failed"
toolbox run -c freecad-toolbox sh ./scripts/compile.sh || echo "freecad dependencies installation failed"


# toolbox run -c freecad-toolbox env QT_QPA_PLATFORM=xcb ./git/fc_build/bin/FreeCAD