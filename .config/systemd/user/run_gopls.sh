#!/usr/bin/env zsh

sudo install -d -o yuzx -g yuzx /var/run/go
source /home/yuzx/.zshrc
/home/yuzx/go/bin/gopls serve -listen="unix;/var/run/go/gopls-daemon-socket" -logfile=/data/logs/go/gopls.log -debug=:60099

