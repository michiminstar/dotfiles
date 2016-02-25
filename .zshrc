source ~/.dotfiles/.zshrc.antigen
source ~/.dotfiles/.exports
source ~/.dotfiles/.aliases
source ~/.dotfiles/.keybinds

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Basic zsh settings
## Prohibit logging out with ^D
setopt ignoreeof

## Prohibit saving duplicate histories
setopt hist_ignore_dups

# automatic tmux start
if [ -z $TMUX ]; then
  tmux -2
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function gem(){
  $HOME/.rbenv/shims/gem $*
  if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
  then
    rbenv rehash
  fi
}

function bundle(){
  $HOME/.rbenv/shims/bundle $*
  if [ "$1" = "install" ] || [ "$1" = "update" ]
  then
    rbenv rehash
  fi
}