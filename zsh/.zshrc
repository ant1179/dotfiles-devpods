# export default term variable to prevent a bug in zsh
# bug documented here: https://stackoverflow.com/questions/17627193/backspace-in-zsh-fails-to-work-in-quite-the-strange-way 
export TERM=xterm

# # Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jonathan"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions fast-syntax-highlighting)
# plugins=(git fzf z chucknorris zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)
#
# # has to be done before sourcing oh-my-zsh.sh
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# ###
# # User configuration
# ###
#
# # environment variables
# export LOCAL_HOME=$HOME/.local
# export CONFIG_HOME=$HOME/.config
# export EDITOR=nvim
#
# alias c="clear"
# alias e="exit"
#
# alias ks="ls"
# alias ls="exa -a --group-directories-first --icons"
# alias ll="ls -l"
# alias lt="ls -l -snew"
#
# alias n="nvim"
