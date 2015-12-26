source ~/.dotfiles/.zshrc.antigen

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

## Prohibit logging out with ^D
setopt ignoreeof

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Case sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime gitfast)
# plugins=(git gitfast)

# User configuration
export PATH="/Users/michimin/.rbenv/shims:/Users/michimin/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# UNIX alias
alias c='clear'

# Sublime Text alias
alias st='subl'

# git alias
alias gd='git diff'
alias gbd='git branch -D'
alias gcam='git commit -am'

# git alias for staging branch
alias gcs='git checkout staging'
alias gspull='git pull origin staging'
alias gps='git pull-request -b staging -m'

#progate csv alias
alias ria='rails runner LessonData.import_all'

# autojump
[[ -s /usr/share/autojump/autojump.zsh ]] && . /usr/share/autojump/autojump.zsh
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

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

export PATH="$HOME/.rbenv/shims:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# tree構造
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
