# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# completion
autoload -Uz compinit
compinit

aws_completion="/usr/local/share/zsh/site-functions/_aws"
[ -f $aws_completion ] && source $aws_completion
