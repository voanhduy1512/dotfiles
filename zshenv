if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export VISUAL=vim
export EDITOR=vim
export GOPATH="$HOME/go"
export PATH="$HOME/.local/bin:$HOME/.bin:/usr/local/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# --files: List files that would be searched but do not search
# # --no-ignore: Do not respect .gitignore, etc...
# # --hidden: Search hidden files and folders
# # --follow: Follow symlinks
# # --glob: Additional conditions for search (in this case ignore everything in
# the .git/ folder)
#
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
