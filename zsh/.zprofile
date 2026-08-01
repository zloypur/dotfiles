# (N) enables null_glob
for f in "$HOME"/.config/zsh/zprofile.d/*.zsh(N); do
  . "$f"
done
