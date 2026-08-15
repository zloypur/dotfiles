# (N) enables null_glob
for f in "$HOME"/.config/zsh/zshrc.d/*.zsh(N); do
  . "$f"
done

# End of a .zshrc. Everything that is below is added autmatically and should be moved to ~/.config/zshrc.d/*-local.zsh
