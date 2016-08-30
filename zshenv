if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

local _old_path="$PATH"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

if [[ $PATH != $_old_path ]]; then
	# `colors` isn't initialized yet, so define a few manually
	typeset -AHg fg fg_bold
	if [ -t 2 ]; then
		fg[red]=$'\e[31m'
		fg_bold[white]=$'\e[1;37m'
		reset_color=$'\e[m'
	else
		fg[red]=""
		fg_bold[white]=""
		reset_color=""
	fi

	cat <<MSG >&2
${fg[red]}Warning:${reset_color} your \`~/.zshenv.local' configuration seems to edit PATH entries.
Please move that configuration to \`.zshrc.local' like so:
	${fg_bold[white]}cat ~/.zshenv.local >> ~/.zshrc.local && rm ~/.zshenv.local${reset_color}
(called from ${(%):-%N:%i})
MSG
fi

unset _old_path

export VISUAL=vim
export EDITOR=$VISUAL
export DEFAULT_USER=`whoami`
export GOPATH="$HOME/.go"
export PATH="$HOME/.local/bin:$HOME/.bin:/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export GOROOT=`go env GOROOT`
export PATH="$PATH:$GOPATH/bin"
export MACHINE_DRIVER=virtualbox
