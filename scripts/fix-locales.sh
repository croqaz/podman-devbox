#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

dpkg-reconfigure --frontend=noninteractive locales
update-locale LANG=en_US.UTF-8
