#
if [[ $(uname) == "Darwin" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    # macOS (Homebrew) paths
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
    export PATH="$(brew --prefix)/opt/postgresql@14/bin:$PATH"

    . "$HOME/.local/bin/env"
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init - zsh)"

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Requires nvim, exa, kubectl, starship, zoxide, fzf
alias vim="nvim"
alias ls="eza"
alias k="kubectl"
alias awk="gawk"
export EDITOR=nvim
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"


set -o emacs
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
