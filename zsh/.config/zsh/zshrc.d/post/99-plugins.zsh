# direnv
if command -v direnv 2>&1 > /dev/null ; then
    eval "$(direnv hook zsh)"
fi

# https://github.com/zsh-users/zsh-autosuggestions
if [[ -d "$ZSH_PLUGINS/zsh-autosuggestions" ]]; then
    . "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# https://github.com/zsh-users/zsh-syntax-highlighting
if [[ -d "$ZSH_PLUGINS/zsh-syntax-highlighting" ]]; then
    . "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
