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
alias beyrep-tunnel="ngrok start beyrep-api-server --log=stdout >/dev/null 2>&1 &"
alias beyrep-db="mongo-express --url 'mongodb://127.0.0.1/migrated' >/dev/null 2>&1 &"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

