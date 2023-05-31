#!/bin/bash

apt update
DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    automake \
    make \
    build-essential \
    libbz2-dev \
    libffi-dev \
    libfreetype6-dev \
    libgdbm-dev \
    libjpeg-dev \
    liblzma-dev \
    libncurses5-dev \
    libnss3-dev \
    libopenblas-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    libxmlsec1-dev \
    libxslt1-dev \
    xz-utils \
    zlib1g-dev

apt remove python3 --yes
rm -rf /usr/lib/python3

apt autoclean
apt autoremove --yes

. ~/.asdf/asdf.sh
asdf plugin add python
asdf install python latest:3.10
asdf global python latest:3.10

pip install --upgrade pip virtualenv ipython
