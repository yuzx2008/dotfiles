#!/usr/bin/env zsh

source /home/yuzx/.zshrc
/home/yuzx/go/bin/gopls serve -listen="unix;/var/run/go/gopls-daemon-socket" -logfile=/data/logs/go/gopls.log -debug=:60099

