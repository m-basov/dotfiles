# vi mode
bindkey -v
export KEYTIMEOUT=1

# history
export HISTFILE="$HOME/.zhistory"
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

# zoxide
eval "$(zoxide init zsh)"

# direnv
eval "$(direnv hook zsh)"

# prompt
eval "$(starship init zsh)"

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# source non-public stuff
if [ -f "$HOME/.non-public" ]; then
    source "$HOME/.non-public"
else
    print "$HOME/.non-public not found."
fi

# aliases
alias ls=exa
alias g=git
alias kl=kubectl
alias cur="printf '\x1b[?25h'"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ,e=nnn
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcrm="docker-compose rm -s"

# BAT
export BAT_THEME=OneHalfLight

# completion
autoload -U compinit
compinit
fpath=("$HOME/.zsh/completions" $fpath)

# cargo
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# go
export GOPATH="${HOME}/.golang"
export PATH="${PATH}:${GOPATH}/bin"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"
