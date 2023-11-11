#!/bin/bash


############################################################
#           freecad development setup for fedora           #
############################################################


# install pre-commit
sudo dnf install -y pre-commit

# create directories and clone my freecad fork
mkdir -p "$HOME"/git/fc_build
git clone https://github.com/howie-j/freecad.git "$HOME"/git/fc

# add main freecad as upstream to easily rebase and fetch PR's
cd "$HOME"/git/fc && git remote add upstream https://github.com/FreeCAD/FreeCAD.git
cd "$HOME" || exit

# create and setup a toolbox with Fedora 38 and install dependencies
toolbox create -y -r38 freecad-toolbox
toolbox run -c freecad-toolbox sh ./scripts/fedora_38_dependencies.sh || echo "freecad dependencies installation failed"

# compile freecad
toolbox run -c freecad-toolbox sh ./scripts/compile.sh || echo "freecad dependencies installation failed"

# run freecad (env QT_QPA_PLATFORM=xcb only necessary on wayland)
toolbox run -c freecad-toolbox env QT_QPA_PLATFORM=xcb "$HOME"/git/fc_build/bin/FreeCAD

# add freecad alias 'fc' to .bashrc
echo "alias fc1='toolbox run -c freecad-toolbox env QT_QPA_PLATFORM=xcb $HOME/git/fc_build/bin/FreeCAD'" >> "$HOME"/.bashrc