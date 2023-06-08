#!/usr/bin/env zsh

cd ~

chsh -s $(which zsh)

git clone --depth=1 --recursive --shallow-submodules \
  https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

(cd $HOME/.zprezto && git gc)

setopt EXTENDED_GLOB

for rcfile in $HOME/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "$HOME/.${rcfile:t}"
done

() {
  local f
  for f in $HOME/.zprezto/**/{*.zsh,*.zsh-theme,functions/*}(.); do
    zcompile -R -- "$f".zwc "$f" 2>/dev/null || true
  done
}

wget -O $HOME/.zpreztorc https://gist.github.com/croqaz/d32deed5e18aa9578f87c9aec2514681/raw/04b40caac472ca3cd61677488ec1e487209995ae/.zpreztorc
wget -O $HOME/.p10k.zsh https://gist.github.com/croqaz/d32deed5e18aa9578f87c9aec2514681/raw/04b40caac472ca3cd61677488ec1e487209995ae/.p10k.zsh

cat >> $HOME/.zshrc << EOF
# Enable Powerlevel10k instant prompt. Stay close to the top of ~/.zshrc.
if [[ -r "~/.cache/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "~/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
fi
EOF

cat >> $HOME/.zshrc << EOF
# Set environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export SSH_KEY_PATH="$HOME/.ssh/id_ecdsa"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
# Source Powerlevel10k config
source ~/.p10k.zsh
EOF

cat >> $HOME/.bashrc << EOF
# Set environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export SSH_KEY_PATH="~/.ssh/id_ecdsa"
EOF

rm $HOME/.profile $HOME/.wget-hsts

source ~/.p10k.zsh
