#!/bin/bash

# create links
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/ghostty ~/.config/ghostty
# ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
# ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua

# install volta without fixing zshrc
curl https://get.volta.sh | bash -s -- --skip-setup

# disable apple music
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew bundle
