#!/bin/sh

DOTFILES_HOME=~/dotfiles

# stow the config file from dotfiles into the container
cd $DOTFILES_HOME
rm -rf .git

# set perl language settings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

rm ~/.zshrc
cp -v $DOTFILES_HOME/zsh/.zshrc ~/.zshrc.bak
cd $DOTFILES_HOME
stow -t ~/ zsh
stow -t ~/ nvim
