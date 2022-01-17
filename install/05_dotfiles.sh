#!/bin/sh

set -e

# Symlink all dotfiles
ln -s -f "$HOME"/init/dotfiles/.vimrc "$HOME"/.vimrc
ln -s -f "$HOME"/init/dotfiles/.zshrc "$HOME"/.zshrc
ln -s -f "$HOME"/init/dotfiles/.tmux.conf "$HOME"/.tmux.conf
ln -s -f "$HOME"/init/dotfiles/.vimrc "$HOME"/.ideavimrc
ln -s -f "$HOME"/init/dotfiles/kitty.conf "$HOME"/.config/kitty/kitty.conf
ln -s -f "$HOME"/init/dotfiles/.k9s/skin.yml "$HOME"/.k9s/skin.yml
ln -s -f "$HOME"/init/dotfiles/.ctags "$HOME"/.ctags
