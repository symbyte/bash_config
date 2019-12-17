export NODE_ENV='dev'
export EDITOR=vim
export BABEL_ENV=commonjs
#bash completion
if [ -f $(brew --prefix)/etc/bash_completion  ]; then
    . $(brew --prefix)/etc/bash_completion
fi
PATH=$PATH:~/Library/Python/2.7/bin

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/stevenchambers/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# old prompt
#-----------------------------------
# export PS1='\[\033[01;32m\] \W\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '''
#----------------------------------

alias "denv"='docker-machine env default && eval $(/usr/local/bin/docker-machine env default)'
alias "dclean"='docker rm $(docker ps -a -q) || true && docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias "json"='python -m json.tool'
function vim { nvim -c ":cd $PWD" $*; }
export -f vim
alias "secrun"="JAVA_OPTS="-Dhttps.port=9443" sbt ~run"
alias "sbt_run_https"="JAVA_OPTS='-Dhttps.port=9443' sbt ~run"

. `brew --prefix`/etc/profile.d/z.sh

mkcd () {
  mkdir "$1" && cd "$_"
}

set -o vi
set show-mode-in-prompt on

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

alias "glog"="git lg3"
alias "gs"="git status"
alias "gc"="git commit"
alias "gf"="git fetch --prune"
alias "gpl"="git pull"
alias "gp"="git push"
alias "ga"="git add"
alias "gam"="git commit -a --amend --no-edit"
alias "gch"="git checkout"
alias "gr"="git rebase"
alias "tdc"="ssh deploy@test-docker-1-a.oseberg.io"
alias "pdc"="ssh deploy@prod-docker-1-a.oseberg.io"
alias "pdbe"="ssh deploy@prod-docker-be-1-a.oseberg.io"
alias "tdbe"="ssh deploy@test-docker-be-1-a.oseberg.io"
alias "tdb"="pgcli -U steven -h test-db1.oseberg.io oelite_test"
alias "tadb"="pgcli -h test-docker-be-1-a.oseberg.io -p 20007 -U postgres account"
alias "pdb"="pgcli -U steven -h prod-db1.oseberg.io oelite"
alias "gtrash"="git stash && git stash clear"
alias "sm"="ssh salt@salt.oseberg.io"
alias "bs"="ssh build@build-atla-main.oseberg.io"
alias "ibt"="npm install && gulp build && gulp test"
alias "sing"="say -v good"
alias "gcb"="git branch --merged | egrep -v \"(^\*|master|develop|test)\" | xargs git branch -d"
alias "kh"="cd /usr/local/Cellar/kafka/0.10.2.0/bin"
alias "tks"="tmux kill-session"
alias "tl"="tmuxp load "
alias "ta"="tmux a"

export NVM_DIR="/Users/stevenchambers/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


export NODE_PATH=/usr/local/lib/node_modules

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias crontab="VIM_CRONTAB=true crontab"

eval "$(_TMUXP_COMPLETE=source tmuxp)"
