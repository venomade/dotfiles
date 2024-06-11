#!/bin/bash

BUILD_WAYLAND=false

cd ~/.build/
rm -rf emacs
git clone git://git.sv.gnu.org/emacs.git --depth 1
cd emacs
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
