#!/bin/bash

set -e

export http_proxy=http://172.16.1.135:3128/
export https_proxy=http://172.16.1.135:3128/
export HTTP_PROXY=http://172.16.1.135:3128/
export HTTPS_PROXY=http://172.16.1.135:3128/

cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git pull
omz update


