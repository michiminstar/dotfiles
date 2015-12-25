# Path to your oh-my-zsh installation.
export ZSH=/Users/michimin/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

## Prohibit logging out with ^D
setopt ignoreeof

# Set name of the theme to load.
# ZSH_THEME="muse"
ZSH_THEME="wezm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Case sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime)
plugins=(git gitfast)

# User configuration
export PATH="/Users/michimin/.rbenv/shims:/Users/michimin/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
