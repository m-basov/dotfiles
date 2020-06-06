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
fpath+=$HOME/.zsh/pure
export PURE_PROMPT_SYMBOL="🐧"
autoload -U promptinit; promptinit
prompt pure

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# BAT
export BAT_THEME=OneHalfLight

# completion
autoload -U compinit
compinit

# gcloud
source ~/google-cloud-sdk/path.zsh.inc

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
