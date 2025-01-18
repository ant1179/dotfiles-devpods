#!/bin/sh

DOTFILES_HOME=~/dotfiles

# set perl language settings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

cp -v ~/.zshrc ~/.zshrc.bak
rm ~/.zshrc
cd $DOTFILES_HOME
stow -t ~/ zsh
stow -t ~/ nvim

exit 0
