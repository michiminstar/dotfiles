#!/bin/sh

set -e
set -u

setup() {
  dotfiles=$HOME/.dotfiles

  has() {
     type "$1" > /dev/null 2>&1
  }

  symlink() {
     [ -e "$2" ] || ln -s "$1" "$2"
  }

  if [ -d "$dotfiles" ]; then
     (cd "$dotfiles" && git pull --rebase)
  else
     git clone https://github.com/michiminstar/dotfiles "$dotfiles"
  fi

  has git && symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
  has zsh && symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
  has tmux && symlink "$dotfiles/.tmux.conf" "$HOME/.tmux.conf"
  has peco && symlink "$dotfiles/.peco/config.json" "$HOME/.peco/config.json"
}

setup
