#!/bin/bash

. ~/.asdf/asdf.sh
asdf plugin add python
asdf install python latest:3.10
asdf global python latest:3.10

pip install --upgrade pip virtualenv ipython
