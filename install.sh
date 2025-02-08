#!/bin/sh
sudo pacman -S xorg xorg-xinit xclip bash-completion feh maim tesseract git curl mpv

SRC_DIR="$HOME/suckless"

programs=("dwm" "st" "dmenu" "dwmblocks")

for prog in "${programs[@]}"; do
    echo "Building and installing $prog..."
    cd "$SRC_DIR/$prog" || { echo "Failed to enter $prog directory"; exit 1; }

    sudo make clean install

    echo "$prog built and installed."
done

echo "All programs have been built and installed!"

