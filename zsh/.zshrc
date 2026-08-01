##################################
###     ZSH configuratoin      ###
##################################

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

# Setup history
HISTFILE=$ZSH_STATE/history

# Setup completions cache
zstyle ':completion:*' cache-path "$ZSH_CACHE"/zcompcache

# Setups colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Source pre local path scripts
# (N) enables null_glob
for f in "$HOME"/.config/zsh/zshrc.d/pre/*.zsh(N); do
  . "$f"
done

# Setup local paths

export PATH="$LOCAL_BIN:$PATH"
export LIBRARY_PATH="$LOCAL_LIB:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$LOCAL_LIB:$LD_LIBRARY_PATH"
fpath=("$ZSH_SITE_FUNCTIONS" $fpath)

# Source post local path scripts
# (N) enables null_glob
for f in "$HOME"/.config/zsh/zshrc.d/post/*.zsh(N); do
  . "$f"
done

# Apply comletions

autoload -Uz compinit
compinit -d "$ZSH_CACHE"/zcompdump-$ZSH_VERSION

# End of a .zshrc. Everything that is below is added autmatically and should be moved to ~/.config/zshrc.d/{pre,post}/*-local.sh
