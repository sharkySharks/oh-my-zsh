#function prompt_char {
#    git branch >/dev/null 2>/dev/null && echo '±' && return
#    hg root >/dev/null 2>/dev/null && echo '☿' && return
#    echo '$'
#}

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
# RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="("
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=")"

function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo " $ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(virtualenv_prompt_info)$(git_prompt_info) '

export EDITOR=vim
export LESS='-iRX'

export PATH="/usr/local/bin:$PATH"
export PATH="/Users/btilley/bin:$PATH"
export PATH="/Users/btilley/src/install/go/go/bin:$PATH"
# export PATH="./node_modules/.bin:$PATH"
export PATH="/Users/btilley/vert.x/bin:$PATH"
export GOROOT="/Users/btilley/src/install/go/go"
# export GOPATH="/Users/btilley/src/install/go/gopath:$GOROOT"
# export GOARCH=amd64
# export GOOS=darwin

[[ -s "/Users/btilley/.rvm/scripts/rvm" ]] && source "/Users/btilley/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "/Users/btilley/.nvm/nvm.sh" ]] && source "/Users/btilley/.nvm/nvm.sh"

setopt hist_ignore_space
setopt hist_no_store

setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups

alias ll="ls -lAh"
alias bx="bundle exec"
#alias rake="bundle exec rake"
alias s="git status"
alias d="git diff"
alias ds="git diff --staged"
unsetopt correct_all

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT="true"
export WORKON_HOME=$HOME/.virtualenvs

source /usr/local/bin/virtualenvwrapper.sh

function auto_virtualenv() {
  if [ -e .venv ]; then
    workon `cat .venv`
  fi
}

function chpwd() {
  auto_virtualenv
}

auto_virtualenv

fortune
