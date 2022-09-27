#!/bin/bash

#install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./dein_installer.sh ~/.cache/dein

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/alacritty.yml ~/.alacritty.yml

# ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
# ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua

# install volta without fixing zshrc
curl https://get.volta.sh | bash -s -- --skip-setup

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew bundle
