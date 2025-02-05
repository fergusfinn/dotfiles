#!/bin/bash
set -e

cp ~/.zshrc zshrc
cp ~/.gitconfig gitconfig

cp -r ~/.config/nvim/ ./nvim/ && rm -rf nvim/.git
