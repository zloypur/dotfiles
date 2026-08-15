# (N) enables null_glob
for f in "$HOME"/.config/zsh/zprofile.d/*.zsh(N); do
  . "$f"
done
#
# End of a .zprofile. Everything that is below is added autmatically and should be moved to ~/.config/zprofile.d/*-local.zsh
