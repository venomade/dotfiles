#!/bin/bash

RECLONE_EMACS=true
BUILD_WAYLAND=false

cd ~/.build/

if [ "$RECLONE_EMACS" = true ]; then
  rm -rf emacs
  git clone https://github.com/emacs-mirror/emacs.git --depth 1
fi

cd emacs

if [ "$RECLONE_EMACS" = false ]; then
    rm -rf build
fi

mkdir build
export CC=/usr/bin/gcc && export CXX=/usr/bin/gcc
./autogen.sh
cd build

CONFIGURE_ARGS="--with-dbus --with-gif --with-jpeg --with-png --with-rsvg --with-tiff --with-xft --with-xpm --with-gpm=no --with-imagemagick --with-json --with-xwidgets --with-modules --with-native-compilation --with-tree-sitter --without-pop"

if [ "$BUILD_WAYLAND" = true ]; then
    CONFIGURE_ARGS="$CONFIGURE_ARGS --with-pgtk"
fi

../configure $CONFIGURE_ARGS
make -j$(nproc)
read -p "Press Enter to install Emacs, C-c if compilation failed"
sudo make clean install -j$(nproc)
