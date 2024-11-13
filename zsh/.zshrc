export ZSH="$HOME/.oh-my-zsh"

ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins

plugins=(git fzf z zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

# has to be done before sourcing oh-my-zsh.sh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

export LOCAL_HOME=$HOME/.local
export CONFIG_HOME=$HOME/.config
export EDITOR=nvim

# aliases
alias c="clear"
alias e="exit"
alias cg="lazygit"
alias ks="ls"
alias ls="exa -a --group-directories-first --icons"
alias ll="ls -l"
alias lt="ls -l -snew"
alias n="nvim"
alias ga="git add ."
alias gs="git status -s"
alias gc="(){git commit -m $1}"
alias stow="stow -t ~/"

if [ -d "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# add key bindings for zsh-history-substring-search plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
