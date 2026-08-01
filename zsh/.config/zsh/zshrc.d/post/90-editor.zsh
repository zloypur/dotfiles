if command -v nvim 2>&1 > /dev/null; then
    export EDITOR='nvim'
elif command -v vim 2>&1 > /dev/null; then
    export EDITOR='vim'
fi

