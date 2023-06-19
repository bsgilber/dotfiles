export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/bin/java

alias ll='ls -lh'
alias gh='history|grep'
alias cg='cd `git rev-parse --show-toplevel`'
alias python=python3
alias pip=pip3

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# update automatically without asking
zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

autoload -Uz compinit
compinit

export NVM_DIR="/Users/flex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

eval "$(nodenv init -)"

#
# "platter postgres watch" - run the 'platter watch' on the specific
# instance in the .env file.
#
function ppw() {
  if [ -f .env ]; then
    set -o allexport; source .env; set +o allexport
    npx platter watch --instance $PLATTER_INSTANCE
  else
    echo "Not in a Node project directory!"
  fi
}

#
# "platter postgres list" - list all the database branches for the given
# platter instance as specified in the .env file under PLATTER_INSTANCE
#
function ppl() {
  if [ -f .env ]; then
    set -o allexport; source .env; set +o allexport
    npx platter postgres branch list --instance $PLATTER_INSTANCE
  else
    echo "Not in a Node project directory!"
  fi
}

#
# "platter postgres list" - list all the database branches for the given
# platter instance as specified in the .env file under PLATTER_INSTANCE
#
function ppl() {
  if [ -f .env ]; then
    set -o allexport; source .env; set +o allexport
    local e=`echo -e "\033"`     # get ESC for macOS sed
    local br=`cat .git/HEAD | sed -e 's:^.*/::'`
    npx platter postgres branch list --instance $PLATTER_INSTANCE | \
      grep $PLATTER_INSTANCE | \
      sed -e "s/$e\[[0-9;]*[a-zA-Z]//g" \
          -e "s/\| $PLATTER_INSTANCE \|/ /g" \
          -e 's/\|.*\|//g' \
          -e "s/  $br/\* $e\[32m$br$e\[0m/"
  else
    echo "Not in a Node project directory!"
  fi
}

#
# "platter postgres drop branch" - drop the specified database branch that
# has been identified with the 'ppl' command, above. This allows us to clean
# up the branches at platter when we are done with them.
#
function ppdb() {
  if [ -f .env ]; then
    set -o allexport; source .env; set +o allexport
    npx platter postgres branch delete $1 --instance $PLATTER_INSTANCE
  else
    echo "Not in a Node project directory!"
  fi
}

#
# "platter psql (postgres command line tool)" - start a psql session on
# the provided branch in the PLATTER_INSTANCE in the .env file in the
# current directory (a Node project repo). If no branch is provided, then
# the current git branch will be used.
#
function ppsql() {
  if [ -f .env ]; then
    set -o allexport; source .env; set +o allexport
    local br=$1
    if [ ${#br} -eq 0 ]; then
      br=`cat .git/HEAD | sed -e 's:^.*/::'`
    fi
    local url=`npx platter postgres branch url ${br} --instance $PLATTER_INSTANCE`
    psql $url
  else
    echo "Not in a Node project directory!"
  fi
}

# usage: ppRenew <branch-name>
# usage: ppRenew chore-add-metrics
function ppRenew() {
  if [ -f .env ]; then
    set -o allexport; source .env; set +o allexport
    npx platter postgres branch delete $1 --instance $PLATTER_INSTANCE
    ppw
  else
    echo "Not in a Node project directory!"
  fi
}

export TERM=xterm-256color

# for gcloud functions with python you need to allow less restrictive multithreading in macos sierra and above
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/flex/Documents/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/flex/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/flex/Documents/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/flex/Documents/google-cloud-sdk/completion.zsh.inc'; fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
