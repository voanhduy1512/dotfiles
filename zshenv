# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
export DEFAULT_USER="anhduyvo"
export GOPATH="$HOME/.go"
# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$HOME/.go/bin

export GOROOT=`go env GOROOT`
# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.dark.sh"
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local