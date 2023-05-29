#!/bin/bash

cd ~

git clone --depth=1 https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

. ~/.asdf/asdf.sh

asdf update
asdf plugin list all
asdf plugin update --all

cat >> $HOME/.zshrc << EOF
# Enable ASDF version manager
. ~/.asdf/asdf.sh
EOF

