
# By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered.
# This results in a very jarring and frustrating transition between modes.
# This can result in issues with other terminal commands that depended on this delay.
# If you have issues try raising the delay.
export KEYTIMEOUT=10

# 查询 options：setopt
# 查询 bindkey

# 默认不会保存 history 到文件，使得 c-p c-n 的搜索不起作用
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=10000000
export HISTSIZE=10000000
export HISTTIMEFORMAT="[%F %T] "
# 确保命令进入文件，默认仅当 shell 退出时，避免意外退出导致丢失，另外可多终端共享
setopt INC_APPEND_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# 粘贴 # 开头行报错：bad pattern
# unsetopt INTERACTIVE_COMMENTS
unsetopt BAD_PATTERN

# setopt CORRECT
# setopt CORRECT_ALL

setopt NO_CASE_GLOB
# ls ~/d*<tab> 会展开
setopt GLOB_COMPLETE

# 支持各种自动完成，注册 compdef 函数
autoload -Uz compinit
compinit

export PATH=$PATH:$HOME/.cargo/bin

# .oh-my-zsh 太慢，换这个 rust 开发的，非常快
eval "$(starship init zsh)"

source /usr/local/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/lib/zsh-history-substring-search.zsh
# c-@ autosuggest-accept
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e4e4e"
# source /usr/local/lib/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt auto_cd

# echo $HOME
export JAVA_HOME=/usr/local/jdk8
export M2_HOME=/usr/local/maven
# export MAVEN_OPTS="-Xms256m -Xmx512m"
export MAVEN_OPTS="-Xms2g -Xmx4g -XX:ReservedCodeCacheSize=512m"
export ANT_HOME=/usr/local/ant
export FINDBUGS_HOME=/usr/local/findbugs
export GRADLE_HOME=/usr/local/gradle
export GROOVY_HOME=/usr/local/groovy
export SCALA_HOME=/usr/local/scala
export SBT_HOME=/usr/local/sbt
export ZINC_HOME=/usr/local/zinc
export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled"
# hadoop
export HADOOP_PREFIX=/usr/local/hadoop
export HBASE_HOME=/usr/local/hbase
export SPARK_HOME=/usr/local/spark3
export FLINK_HOME=/usr/local/flink
export ZOOKEEPER_HOME=/usr/local/zookeeper
export KAFKA_HOME=/usr/local/kafka
export GOROOT=/usr/local/go
export NODE_HOME=/usr/local/node
export YARN_HOME=/usr/local/yarn
export ANDROID_NDK=/usr/local/android-ndk
export ANDROID_SDK=/usr/local/android-sdk
export OOZIE_CLIENT_HOME=/usr/local/oozie-client
export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$GRADLE_HOME/bin:$GROOVY_HOME/bin:$SCALA_HOME/bin:$SBT_HOME/bin:$ZINC_HOME/bin:FINDBUGS_HOME/bin
export PATH=$PATH:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin
export PATH=$PATH:$HBASE_HOME/bin
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export PATH=$PATH:$FLINK_HOME/bin
export PATH=$PATH:$ZOOKEEPER_HOME/bin
export PATH=$PATH:$KAFKA_HOME/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$NODE_HOME/bin:$YARN_HOME/bin
export PATH=$PATH:$ANDROID_NDK
export PATH=$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools
export PATH=$PATH:$OOZIE_CLIENT_HOME/bin
export PATH=$PATH:/opt/bin
export PATH="$HOME/.cabal/bin:$PATH"

# swift 4 tensorflow
export PATH=$PATH:/opt/usr/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/lib/pkgconfig

# cuda
export PATH=$PATH:/usr/local/cuda-12.6/bin
# or
# /etc/ld.so.conf add /usr/local/cuda-12.6/lib64
# ldconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.6/lib64

export LD_LIBRARY_PATH=/usr/local/hadoop/lib/native:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/yuzx/.rvm/rubies/default/lib:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/mysql/lib

# GOPATH
export GOPROXY=https://goproxy.cn
export GOPRIVATE=gitlab.bj.sensetime.com
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/mysql/bin
export GO111MODULE=on

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=$PATH:$HOME/.rvm/bin
export MINIKUBE_HOME=/data/yuzx
export R_LIBS_USER=/data/R
export STACK_ROOT=/data/.stack
export PATH=$PATH:$HOME/.local/bin
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
# 4 rJava
export LD_LIBRARY_PATH=/usr/local/jdk8/jre/lib/amd64/server:$LD_LIBRARY_PATH

export PATH=$PATH:$HOME/.krew/bin
export PATH=$PATH:/usr/local/libexec

# 4 fcitx
export PATH=$PATH:/usr/lib/x86_64-linux-gnu/libgtk-3-0
export PATH=$PATH:/usr/lib/x86_64-linux-gnu/libgtk2.0-0
export GTK_PATH=$GTK_PATH:/usr/local/lib/gtk-2.0:/usr/local/lib/gtk-3.0:/usr/local/lib/gtk-4.0

# export PATH="/opt/miniconda3/bin:$PATH"  # commented out by conda initialize

export PATH=$PATH:/usr/local/pgsql/bin

# export GTK_DEBUG=modules
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# export TERM=screen-256color       # for a tmux -2 session (also for screen)

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
# eval 'dircolors ~/.dircolors'

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  # export EDITOR='mvim'
  export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias tmux="tmux -2"
alias start_mysql="cd /usr/local/mysql ; sudo ./bin/mysqld_safe --user=mysql & ; cd -"
alias stop_mysql="mysqladmin -u root -pmysql1 shutdown"
alias start_redis="sudo redis-server /etc/redis/redis.conf"
alias start_memcached="memcached -d -m 64 -u root -l 127.0.0.1 -p 12111 -c 1024"
alias stop_mysql="mysqladmin -u root -pmysql1 shutdown"
alias start_zk="zkServer.sh start"
alias stop_zk="zkServer.sh stop"
alias start_hbase="start-hbase.sh"
alias stop_hbase="stop-hbase.sh"
alias start_kafka="cd /usr/local/kafka; bin/kafka-server-start.sh -daemon config/server.properties"
alias stop_kafka="cd /usr/local/kafka; bin/kafka-server-stop.sh"
alias start_oozie="/usr/local/oozie/bin/oozied.sh start"
alias stop_oozie="/usr/local/oozie/bin/oozied.sh stop"
alias conda-b="conda activate base"

alias start_gopls="gopls serve -listen=127.0.0.1:60098 -logfile=/tmp/gopls-server.log -debug=127.0.0.1:60099"

alias k=/usr/local/bin/kubectl
alias kf="/usr/local/bin/kubectl --grace-period=0 --force --wait=false"
alias o=/usr/local/bin/opensearch-cli
alias u=$HOME/go/bin/ucpctl

alias ls='ls --color=auto -Fh --group-directories-first'
alias ll='ls -lh'
alias l='ls -lh'
# Show hidden files
alias l.='ls -d .* --color=auto'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias b='mdbook serve'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%Y-%m-%d %H:%M:%S"'

# if [ -f "/usr/bin/nvim" ]; then
#     alias vim=nvim
#     alias vimdiff="nvim -d"
# fi

# ag='sudo apt'，与 /usr/bin/ag 冲突
# unalias ag

bindkey -v

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# bind k and j for VI mode
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# fix: Vi-mode: Backspace not working as expected in insert mode
bindkey "^?" backward-delete-char

# home & end
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# bindkey '^K' autosuggest-accept

# Avoid "zsh: no matches found: xxxx"
# or alias scp='noglob scp'
unsetopt nomatch


if [ $commands[kubectl]  ]; then
  source <(kubectl completion zsh)
fi

if [ $commands[helm]  ]; then
  source <(helm completion zsh)
fi

if [ $commands[golangci-lint]  ]; then
  source <(golangci-lint completion zsh)
fi

export KUBECONFIG=$HOME/.kube/config
# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1

[[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh

# 用于更新 toolchain
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# 用于更新 rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share

export LC_TIME=en_US.UTF-8

# 避免 snap run xxx 出现 /user.slice/user-1000.slice/session-1.scope is not a snap cgroup
# XDG_RUNTIME_DIR=/run/user/1000
# export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# zmodload zsh/zprof

# Refresh environment variables in tmux.
if [ -n "$TMUX" ]; then
    function refresh {
        sshauth=$(tmux show-environment | grep "^SSH_AUTH_SOCK")
        if [ $sshauth ]; then
            export $sshauth
        fi
        display=$(tmux show-environment | grep "^DISPLAY")
        if [ $display ]; then
            export $display
        fi
    }
else
    function refresh { }
fi

function preexec {
    # Refresh environment if inside tmux
    refresh
}

function precmd {
}


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/yuzx/go/bin/mc mc

# zsh completion for step
_step() {
  local -a opts
  local cur
  cur=${words[-1]}
  if [[ "$cur" == "-"* ]]; then
    opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 ${words[@]:0:#words[@]-1} ${cur} --generate-bash-completion)}")
  else
    opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 ${words[@]:0:#words[@]-1} --generate-bash-completion)}")
  fi

  if [[ "${opts[1]}" != "" ]]; then
    _describe 'values' opts
  else
    _files
  fi

  return
}

compdef _step step

