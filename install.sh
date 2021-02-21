#!/usr/bin/env bash

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

ln -sfv "$DOTFILES_DIR/bash/bashrc" ~/.bashrc.local
ln -sfv "$DOTFILES_DIR/bash/bash_aliases" ~/.bash_aliases
ln -sfv "$DOTFILES_DIR/bash/bash_functions" ~/.bash_functions
ln -sfv "$DOTFILES_DIR/bash/bash_git" ~/.bash_git
ln -sfv "$DOTFILES_DIR/bash/bash_go" ~/.bash_go
ln -sfv "$DOTFILES_DIR/bash/bash_aws" ~/.bash_aws

ln -sfv "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/config.fish
ln -sfv "$DOTFILES_DIR/fish/shell.fish" ~/.config/fish/shell.fish

ln -sfv "$DOTFILES_DIR/vim/vimrc.local" ~/.vimrc.local
ln -sfv "$DOTFILES_DIR/vim/vimrc.bundles.local" ~/.vimrc.bundles.local

ln -sfv "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig

ln -sfv "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf

vim +PluginInstall +qall
