# File searching utilities
sudo apt update && sudo apt install -y lsd fzf zsh

# zsh as default shell
chsh -s $(which zsh)

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
export PATH=$PATH:~/.local/bin

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Setup nvim config
mkdir -p ~/.config/nvim
mv nvim/* ~/.config/nvim/
