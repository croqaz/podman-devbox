#!/bin/bash

gpg -k
gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/neovim-ppa.gpg \
	--keyserver keyserver.ubuntu.com --recv-keys 9DBB0BE9366964F134855E2255F96FCF8231B6DD

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/neovim-ppa.gpg] https://ppa.launchpadcontent.net/neovim-ppa/stable/ubuntu mantic main' > \
	/etc/apt/sources.list.d/neovim-ppa.list
echo 'deb-src [arch=amd64 signed-by=/usr/share/keyrings/neovim-ppa.gpg] https://ppa.launchpadcontent.net/neovim-ppa/stable/ubuntu mantic main' >> \
	/etc/apt/sources.list.d/neovim-ppa.list

apt update
apt install -y --no-install-recommends neovim
nvim --version
