#!/bin/bash


########################################################
#           fedora 38 freecad dependencies             #
########################################################


# install mandatory packages
sudo dnf install -y \
boost-devel \
cmake \
Coin4-devel \
eigen3-devel \
med-devel \
opencascade-devel \
openmpi-devel \
python3-devel \
python3-matplotlib \
python3-pivy \
python3-pyside2-devel \
python3-shiboken2-devel \
qt5-qtsvg-devel \
qt5-qttools-static \
qt5-qtwebengine-devel \
qt5-qtxmlpatterns-devel \
swig \
xerces-c-devel \
yaml-cpp-devel


# install otional packages
sudo dnf install -y \
ccache \
Coin4-doc \
libspnav-devel \
doxygen \
PackageKit-gtk3-module
