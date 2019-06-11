# history
export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

export PURE_PROMPT_SYMBOL=""
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval "$(direnv hook zsh)"

export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"

autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# aliases
alias ls=exa
alias vim=nvim
alias g=git
alias gf="git flow"
alias kl=kubectl
alias cur="printf '\x1b[?25h'"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# source non-public stuff
if [ -f ~/.non-public ]; then
    source ~/.non-public
else
    print "~/.non-public not found."
fi
