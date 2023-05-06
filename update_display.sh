#!/usr/bin/env bash

# 任一语句失败就退出
set -e
# set -x

# cp from https://gist.github.com/mikeboiko/b6e50210b4fb351b036f1103ea3c18a9
# https://github.com/tmux-plugins/tmux-yank

# The problem:
# When you `ssh -X` into a machine and attach to an existing tmux session, the session
# contains the old $DISPLAY env variable. In order the x-server/client to work properly,
# you have to update $DISPLAY after connection. For example, the old $DISPLAY=:0 and
# you need to change to DISPLAY=localhost:10.0 for the ssh session to
# perform x-forwarding properly.

# The solution:
# When attaching to tmux session, update $DISPLAY for each tmux pane in that session
# This is performed by using tmux send-keys to the shell.
# This script handles updating $DISPLAY within vim also

LOGFILE=/tmp/update_display.log

# $0=/usr/local/bin/update_display.sh
# $(dirname $0)=/usr/local/bin
# pushd 将 /usr/local/bin 入栈，并 cd 到 /usr/local/bin
pushd $(dirname $0) > /dev/null

# SCRIPTPATH=/usr/local/bin
SCRIPTPATH=$(pwd -P)

# 将当前目录 /usr/local/bin 出栈，cd 到原来的目录
popd > /dev/null

# SCRIPTFILE=update_display.sh
SCRIPTFILE=$(basename $0)

function log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S%z') [INFO] - $@" >> $LOGFILE
}

function err() {
  echo "$(date +'%Y-%m-%d %H:%M:%S%z') [ERRO] - $@" >> $LOGFILE
}

log "dirname=$(dirname $0)"
log "SCRIPTPATH=$SCRIPTPATH"
log "SCRIPTFILE=$SCRIPTFILE"
log "pwd=$(pwd)"

# NEW_DISPLAY=$DISPLAY
# NEW_DISPLAY=$(tmux show-env | sed -n 's/^DISPLAY=//p')
if [[ "$1" == "" ]]; then
  NEW_DISPLAY=$DISPLAY
else
  NEW_DISPLAY=$1
fi

log "NEW_DISPLAY=$NEW_DISPLAY"

function ChangeEnvDisplay() {
  # Update $DISPLAY in bash, zsh and vim/nvim
  tmux list-panes -s -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" | \
  while read pane_process
  do
      log "pane_process: ${pane_process}"
      IFS=' ' read -ra pane_process <<< "$pane_process"
      if [[ "${pane_process[1]}" == "zsh" || "${pane_process[1]}" == "bash" ]]; then
  	tmux send-keys -t ${pane_process[0]} "export DISPLAY=$NEW_DISPLAY" Enter
      elif [[ "${pane_process[1]}" == *"vi"* ]]; then
  	tmux send-keys -t ${pane_process[0]} Escape
  	tmux send-keys -t ${pane_process[0]} ":let \$DISPLAY = \"$NEW_DISPLAY\"" Enter
  	tmux send-keys -t ${pane_process[0]} ":silent! xrestore" Enter
      fi
  done
}

ChangeEnvDisplay
