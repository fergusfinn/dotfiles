#
if [[ $(uname) == "Darwin" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    # macOS (Homebrew) paths
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi

# Requires nvim, exa, kubectl, starship, zoxide, fzf
alias vim="nvim"
alias k="kubectl"
alias awk="gawk"
export EDITOR=nvim
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

set -o emacs
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
