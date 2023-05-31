#!/bin/bash

cd /tmp/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.tar.xz
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/VictorMono.tar.xz

tar -xf JetBrainsMono.tar.xz
tar -xf VictorMono.tar.xz

mkdir -p ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
rm /tmp/*.xz
rm /tmp/*.md

fc-cache -frv
