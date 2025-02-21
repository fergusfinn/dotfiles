#!/bin/bash
set -e

cp ~/.zshrc zshrc
cp ~/.gitconfig gitconfig

cp -r ~/.config/nvim/ ./config/nvim/ && rm -rf ./config/nvim/.git
cp -r ~/.config/k9s/ ./config/k9s/
cp -r ~/.config/atuin/ ./config/atuin/
