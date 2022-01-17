#!/bin/sh

set -e

# Tools to Install through brew package manager
tools="
    tmux
    pyenv
    kubectl
    exa
    node
    npm
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
    gh
    tmux-mem-cpu-load
    mongodb-community
    mongodb-compass
    dbeaver-community
    kitty
    keeper-password-manager
    docker
    r
    rstudio
    intellij-idea-ce
    spotify
    visual-studio-code
    shfmt
    scala
    sbt
    htop
    dbt
    terraform
    redis
    minikube
"

for tool in $tools; do
    brew install "$tool"
done
