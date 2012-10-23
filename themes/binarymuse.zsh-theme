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
RPROMPT='${return_status}%{$reset_color%}'

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) '

export EDITOR=vim
export LESS='-iRX'

export PATH="/usr/local/bin:$PATH"
export PATH="/Users/btilley/bin:$PATH"
export PATH="/Users/btilley/src/install/go/go/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="/Users/btilley/vert.x/bin:$PATH"
export GOROOT="/Users/btilley/src/install/go/go"
# export GOPATH="/Users/btilley/src/install/go/gopath:$GOROOT"
# export GOARCH=amd64
# export GOOS=darwin

[[ -s "/Users/btilley/.rvm/scripts/rvm" ]] && source "/Users/btilley/.rvm/scripts/rvm"
[[ -s "/Users/btilley/.nvm/nvm.sh" ]] && source "/Users/btilley/.nvm/nvm.sh"

setopt hist_ignore_space
setopt hist_no_store

alias ll="ls -lAh"
alias bx="bundle exec"
#alias rake="bundle exec rake"
alias s="git status"
alias d="git diff"
alias ds="git diff --staged"

fortune
