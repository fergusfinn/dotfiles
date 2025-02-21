#!/bin/bash
set -e

echo $PWD
ls

cp zshrc $HOME/.zshrc
cp gitconfig $HOME/.gitconfig

mkdir -p ~/.config/nvim
mkdir -p ~/.config/k9s
mkdir -p ~/.config/atuin
cp -r nvim/* $HOME/.config/nvim/
cp -r k9s/* $HOME/.config/k9s/
cp -r atuin/* $HOME/.config/atuin/
