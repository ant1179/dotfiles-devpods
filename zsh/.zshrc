# export default term variable to prevent a bug in zsh
# bug documented here: https://stackoverflow.com/questions/17627193/backspace-in-zsh-fails-to-work-in-quite-the-strange-way 
export TERM=xterm
export EDITOR=nvim

export LC_CTYPE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# # Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git fzf z zsh-syntax-highlighting zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete zsh-history-substring-search)

# # has to be done before sourcing oh-my-zsh.sh
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# keybindings for zsh-history-substring-search plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# aliases
alias c="clear"
alias e="exit"

alias ks="ls"
alias ls="eza -a --group-directories-first --icons"
alias ll="ls -l"
alias lt="ls -l -snew"

alias n="nvim"

alias bat="batcat"

if [ -d ~/.fzf ]; then
  export FZF_HOME=~/.fzf
  export PATH=$FZF_HOME/bin:$PATH
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
