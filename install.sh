set -e

cp zshrc $HOME/.zshrc
cp gitconfig $HOME/.gitconfig

mkdir -p ~/.config/nvim
cp -r nvim/* .config/nvim/
