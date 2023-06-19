#!/bin/sh

set -e

# Tools to Install through brew package manager
tools="
    tmux
    pyenv
    exa
    node
    npm
    nvm
    ctags
    bat
    openjdk
    rg
    awk
    go
    jq
    pandoc
    shellcheck
    k9s
    rename
    gh
    tmux-mem-cpu-load
    mongodb-community
    mongodb-compass
    dbeaver-community
    kitty
    bitwarden
    docker
    r
    rstudio
    intellij-idea-ce
    spotify
    visual-studio-code
    shfmt
    htop
    dbt
    terraform
    redis
    go-migrate
    nodenv
    git-lfs
    pulumi/tap/pulumi
    ripgrep
    tflint
    minikube
    dbt-bigquery
    postgresql
    ngrok
    yarn
    fzf
"

for tool in $tools; do
    brew install "$tool"
done
