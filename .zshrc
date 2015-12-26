source ~/.dotfiles/.zshrc.antigen
source ~/.dotfiles/.aliases

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# User configuration
export PATH="/Users/michimin/.rbenv/shims:/Users/michimin/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

## rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# rbenvの環境設定
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

## Prohibit logging out with ^D
setopt ignoreeof