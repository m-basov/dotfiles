export LANG=en_US.UTF-8

# vi mode
bindkey -v
export KEYTIMEOUT=1

# history
export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# direnv
eval "$(direnv hook zsh)"

# prompt
export PURE_PROMPT_SYMBOL=""
autoload -U promptinit; promptinit
prompt pure

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# homebrew
export PATH="/usr/local/sbin:$PATH"
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# source non-public stuff
if [ -f ~/.non-public ]; then
    source ~/.non-public
else
    print "~/.non-public not found."
fi

# aliases
alias ls=exa
alias vim=nvim
alias g=git
alias gf="git flow"
alias kl=kubectl
alias cur="printf '\x1b[?25h'"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# BAT
export BAT_THEME=OneHalfLight

# completion
autoload -U compinit
compinit

# gcloud
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# volta
export VOLTA_HOME="/Users/mbasov/.volta"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"
