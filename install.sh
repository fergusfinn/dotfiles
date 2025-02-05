#!/bin/bash
set -e

# Setup local bindir
mkdir -p ~/.local/bin
export PATH="$HOME/.local/bin/:$PATH"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Install Homebrew if not installed
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install kubectl starship lsd fzf zsh
else
  echo "Installing dependencies using apt..."
  sudo apt update && sudo apt install -y fzf zsh
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  mkdir -p ~/.local/bin
  mv ./kubectl ~/.local/bin/kubectl
  export PATH=$PATH:~/.local/bin

  # Install starship
  curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir ~/.local/bin
fi

# Install zoxide
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install zoxide
else
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Setup nvim config
mkdir -p ~/.config/nvim
cp -rf nvim/* ~/.config/nvim/

# Move dotfiles to home directory
cp zshrc ~/.zshrc
cp gitconfig ~/.gitconfig

echo "Installation complete! Please restart your terminal for changes to take effect."
