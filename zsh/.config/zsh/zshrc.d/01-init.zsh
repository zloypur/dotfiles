# Setup prompt

PROMPT='%F{green}%~%f at %F{#A9A9A9}%*%f %(?..%B%F{red}!%f%b)'$'\n''%(!.#.$) '

# Keybindings

# just use Emacs
bindkey -e

# Base dirs

ZSH_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/zsh"
ZSH_STATE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
ZSH_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
ZSH_SITE_FUNCTIONS="$ZSH_DATA/site-functions"
ZSH_PLUGINS="$ZSH_DATA/plugins"

ZSH_DIRS=(
    "$ZSH_DATA"
    "$ZSH_STATE"
    "$ZSH_CACHE"
    "$ZSH_SITE_FUNCTIONS"
    "$ZSH_PLUGINS"
)

for d in $ZSH_DIRS; do
    if [[ ! -d "$d" ]]; then
        mkdir -p "$d"
    fi
done

# Setup history
HISTFILE=$ZSH_STATE/history

# Setup completions cache
zstyle ':completion:*' cache-path "$ZSH_CACHE"/zcompcache

# Setups colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
