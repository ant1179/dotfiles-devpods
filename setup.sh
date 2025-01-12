#!/bin/sh

# stow the config file from dotfiles into the container
cd ~/dotfiles
rm -rf .git

# set perl language settings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

rm ~/.zshrc
cp -v zsh/.zshrc ~/.zshrc.bak
stow -t ~/ zsh
source ~/.zshrc

stow nvim

cd
