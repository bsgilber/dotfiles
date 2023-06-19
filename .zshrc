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

export TERM=xterm-256color

# for gcloud functions with python you need to allow less restrictive multithreading in macos sierra and above
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
