#!/bin/sh

# install powerline fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd .. && rm -rf fonts

# install oh-my-zsh plugins
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting'
zsh -c 'git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete'
zsh -c 'git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search'

# install additional software packages using apt (keep it at minimum)
sudo apt update && \
	sudo apt install exa bat ripgrep stow -y

# install non available packages through brew
brew install jless

# copy the zsh config file from dotfiles into the container
cp ./zsh/.zshrc ~

# install fzf manually (throws error when installed through binary)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
echo "export FZF_HOME=~/.fzf" >> ~/.zshrc
echo "export PATH=\$FZF_HOME/bin:\$PATH" >> ~/.zshrc
echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh \n" >> ~/.zshrc

# configure nerd font
# cd ~
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
# mkdir -p .local/share/fonts
# unzip Meslo.zip -d .local/share/fonts
# cd .local/share/fonts
# rm *Windows*
# cd ~
# rm Meslo.zip
# fc-cache -fv

# stow configuration for dotfiles
cd ~/dotfiles
rm -rf .git
stow -t ~/ nvim

# remove username@hostname in the prompt
prompt_context() {}
prompt_context()

# switch to zsh
echo "zsh" >> ~/.bashrc

