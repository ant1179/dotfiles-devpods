# export default term variable to prevent a bug in zsh
# bug documented here: https://stackoverflow.com/questions/17627193/backspace-in-zsh-fails-to-work-in-quite-the-strange-way
export TERM=xterm
export EDITOR=nvim
export GPG_TTY=$(tty)

export LC_CTYPE=en_US.UTF-8

# # Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git fzf z zsh-syntax-highlighting zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete zsh-history-substring-search direnv)

# has to be done before sourcing oh-my-zsh.sh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# include completion in kubectl if installed
if kubectl > /dev/null 2>& 1; then
  source <(kubectl completion zsh)
  complete -o default -F __start_kubectl k
  kubectl completion zsh > "${fpath[1]}/_kubectl"
fi

# include completion in flux if installed
if flux > /dev/null 2>& 1; then
  command -v flux >/dev/null && . <(flux completion zsh)
fi

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
alias cg="lazygit"
alias t="tmux"
alias tn="(){tmux new -s $1}"

alias k="kubectl"
alias kcon="(){kubectl exec --namespace=$1 --stdin --tty $2 -- /bin/bash}"
alias kctx="(){kubectl config set-context --current --namespace=$1}"

alias stow="stow -t ~/"
alias bat="batcat"

if [ -d ~/.fzf ]; then
  export FZF_HOME=~/.fzf
  export PATH=$FZF_HOME/bin:$PATH
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
  source /usr/share/nvm/init-nvm.sh
fi
