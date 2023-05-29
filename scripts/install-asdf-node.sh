#!/bin/bash

. ~/.asdf/asdf.sh
asdf plugin add nodejs
asdf install nodejs latest:18
asdf global nodejs latest:18

npm install -g npm node-gyp

