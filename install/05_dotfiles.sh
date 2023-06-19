#!/bin/sh

set -e

# Symlink all dotfiles
ln -s -f "$HOME"/projects/dotfiles/.vimrc "$HOME"/.vimrc
ln -s -f "$HOME"/projects/dotfiles/.zshrc "$HOME"/.zshrc
ln -s -f "$HOME"/projects/dotfiles/.bashrc "$HOME"/.bashrc
ln -s -f "$HOME"/projects/dotfiles/.fzf.bash "$HOME"/.fzf.bash
ln -s -f "$HOME"/projects/dotfiles/.tmux.conf "$HOME"/.tmux.conf
ln -s -f "$HOME"/projects/dotfiles/.vimrc "$HOME"/.ideavimrc
ln -s -f "$HOME"/projects/dotfiles/kitty.conf "$HOME"/.config/kitty/kitty.conf
ln -s -f "$HOME"/projects/dotfiles/.k9s/skin.yml "$HOME"/.k9s/skin.yml
ln -s -f "$HOME"/projects/dotfiles/.ctags "$HOME"/.ctags
