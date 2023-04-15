#!/usr/bin/env bash

set -o pipefail
set -x

export GOROOT=/usr/local/go
export GOPROXY=https://goproxy.cn
export GOPRIVATE=gitlab.bj.sensetime.com/diamond/*
export GOPATH=/home/yuzx/go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export SHELL=/usr/local/bin/zsh
export HOME=/home/yuzx

gopls serve -listen=127.0.0.1:60098 -logfile=/tmp/gopls.log -debug=127.0.0.1:60099
