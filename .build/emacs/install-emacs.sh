#!/bin/bash
# Basic Dependencies
sudo apt install -y \
  git \
  build-essential \
  libgtk-3-dev \
  libgnutls28-dev \
  libtiff5-dev \
  libgif-dev \
  libjpeg-dev \
  libpng-dev \
  libxpm-dev \
  libncurses-dev \
  texinfo
# Native JSON
sudo apt install -y libjansson4 libjansson-dev
# Native Compilation
sudo apt install -y \
  libgccjit0 \
  libgccjit-11-dev \
  gcc-11 \
  g++-11
# Images
sudo apt install -y libmagickcore-dev libmagick++-dev
# TreeSitter
sudo apt install -y libtree-sitter-dev
# GTK3
sudo apt install -y libgtk-3-dev libwebkit2gtk-4.1-dev
# VTerm
sudo apt install -y cmake libtool-bin

# Download Font
# Install Font
FONT="FantasqueSansMono"
FONT_ARCHIVE="${FONT}.zip"
FONT_DIRECTORY="$HOME/.local/share/fonts/${FONT}"

if [ ! -f "$FONT_ARCHIVE" ]; then
    # Download the archive
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/$FONT_ARCHIVE"
fi

if [ -d "$FONT_DIRECTORY" ]; then
    echo "Directory $FONT_DIRECTORY already exists. Deleting it."
    rm -rf "$FONT_DIRECTORY"
fi

mkdir -p "$FONT_DIRECTORY"
unzip -o "$FONT_ARCHIVE" -d "$FONT_DIRECTORY"
fc-cache -fv

# Download Emacs
# Define the version variable
VERSION="29.4"
ARCHIVE="emacs-${VERSION}.tar.xz"
DIRECTORY="emacs-${VERSION}"

if [ -f "$ARCHIVE" ]; then
    echo "Archive $ARCHIVE already exists. Skipping download."
else
    wget "https://mirror.lyrahosting.com/gnu/emacs/$ARCHIVE"
fi

if [ -d "$DIRECTORY" ]; then
    echo "Directory $DIRECTORY already exists. Deleting it."
    #TODO FIX THIS DANGEROUS LINE
    sudo rm -rf "$DIRECTORY"
fi

tar -xf "$ARCHIVE"

#Build Emacs
tar xvf emacs-*.tar.xz
cd $(find . -maxdepth 1 -type d -name 'emacs-*' | head -n 1)
export CC=/usr/bin/gcc-11 CXX=/usr/bin/gcc-11
./autogen.sh
mkdir build
cd build

CONFIGURE_ARGS="--with-dbus --with-gif --with-jpeg --with-png --with-rsvg --with-tiff --with-xft --with-xpm --with-gpm=no --with-imagemagick --with-json --with-xwidgets --with-x-toolkit=gtk3 --with-cairo --with-modules --with-native-compilation --with-tree-sitter --without-pop"

../configure $CONFIGURE_ARGS CFLAGS="-O2 -pipe -march=native"
make -j $(($(nproc) - 1)) CFLAGS="-O2 -pipe -march=native"
read -p "Press Enter to install Emacs, C-c if compilation failed"
sudo make clean install -j $(($(nproc) - 1))
