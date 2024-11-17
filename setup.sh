#!/bin/sh

# install powerline fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd .. && rm -rf fonts

# copy the zsh config file from dotfiles into the container
cp ./zsh/.zshrc ~

# switch to zsh
echo "zsh" >> ~/.bashrc

# install oh-my-zsh plugins
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting'
# zsh -c 'git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete'

# # copy the zsh config file from dotfiles into the container
# #cp ./zsh/.zshrc ~

# # install agnoster theme
# mv ~/.zshrc ~/.zshrc.bak
#
# sudo sh -c "$(wget -O- https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh)" -- \
#     -t agnoster
#
# # remove newly created zshrc
# rm -f ~/.zshrc
# # restore saved zshrc
# mv ~/.zshrc.bak ~/.zshrc
# # update theme
# sed -i '/^ZSH_THEME/c\ZSH_THEME="agnoster"' ~/.zshrc

# ###
# # Install
# ###
#
# sudo apt update && \
# sudo apt install stow -y && \
# sudo apt install fontconfig -y
#
# ###
# # Configure nerd font
# ###
#
# cd ~
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
# mkdir -p .local/share/fonts
# unzip Meslo.zip -d .local/share/fonts
# cd .local/share/fonts
# rm *Windows*
# cd ~
# rm Meslo.zip
# fc-cache -fv
#
# ###
# # Stow configurations
# ###
#
# cd ~/dotfiles
# stow -t ~/ nvim
