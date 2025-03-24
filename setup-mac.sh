#!/bin/bash

# Exit on error
set -e

echo "Starting Mac development environment setup..."

# Check for Homebrew and install if not present
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH if needed
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed, updating..."
    brew update
fi

# Install Git LFS
echo "Installing Git LFS..."
brew install git-lfs
git lfs install

# Install GitHub CLI
echo "Installing GitHub CLI..."
brew install gh

# Install eza (modern replacement for ls)
echo "Installing eza..."
brew install eza

# Install kubectl
echo "Installing kubectl..."
brew install kubectl

# Install Starship prompt
echo "Installing Starship prompt..."
brew install starship
# Add to shell config if not already present
if ! grep -q "eval \"\$(starship init zsh)\"" ~/.zshrc 2>/dev/null; then
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

# Install ripgrep
echo "Installing ripgrep..."
brew install ripgrep

# Install zoxide (smarter cd command)
echo "Installing zoxide..."
brew install zoxide
# Add to shell config if not already present
if ! grep -q "eval \"\$(zoxide init zsh)\"" ~/.zshrc 2>/dev/null; then
    echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
fi

# Install fzf (fuzzy finder)
echo "Installing fzf..."
brew install fzf
# Add to shell config if not already present
if ! grep -q "source \$(brew --prefix)/opt/fzf/shell/completion.zsh" ~/.zshrc 2>/dev/null; then
    echo 'source $(brew --prefix)/opt/fzf/shell/completion.zsh' >> ~/.zshrc
    echo 'source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh' >> ~/.zshrc
fi

# Install zsh if not already the default shell
echo "Setting up zsh..."
brew install zsh
if [[ "$SHELL" != *"zsh"* ]]; then
    echo "Changing default shell to zsh..."
    chsh -s $(which zsh)
fi

# Install atuin (shell history enhancement)
echo "Installing atuin..."
brew install atuin
# Add to shell config if not already present
if ! grep -q "eval \"\$(atuin init zsh)\"" ~/.zshrc 2>/dev/null; then
    echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
fi

# Install depot CLI
echo "Installing depot CLI..."
curl -L https://depot.dev/install-cli.sh | sh

# Install Docker CLI (note: on Mac, Docker Desktop might be preferable)
echo "Installing Docker CLI..."
brew install docker

# Install Helm
echo "Installing Helm..."
brew install helm

# Install k9s (Kubernetes UI)
echo "Installing k9s..."
brew install k9s

# Install skaffold
echo "Installing skaffold..."
brew install skaffold

# Install PostgreSQL
echo "Installing PostgreSQL..."
brew install postgresql@14
# Start PostgreSQL service
brew services start postgresql@14

# Add PostgreSQL binaries to PATH if not already there
if ! grep -q "postgresql@14" ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$(brew --prefix)/opt/postgresql@14/bin:$PATH"' >> ~/.zshrc
fi

# Install Neovim
echo "Installing Neovim..."
brew install neovim

# Install nvm (Node Version Manager)
echo "Installing nvm (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Add nvm to shell config if not already present
if ! grep -q "NVM_DIR" ~/.zshrc 2>/dev/null; then
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc
fi

# Source nvm to use it right away
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest LTS version of Node.js
echo "Installing Node.js LTS version..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# Verify installations
echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"

echo "============================"
echo "Setup completed successfully!"
echo "============================"
echo ""
echo "Please restart your terminal or run 'source ~/.zshrc' to apply all changes."
echo "Some tools may require additional configuration - check their documentation for details."
