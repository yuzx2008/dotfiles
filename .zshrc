
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

# 兼容已经存在的 Bash shell completion
autoload -Uz bashcompinit && bashcompinit

export PATH=$PATH:$HOME/.cargo/bin

# .oh-my-zsh 太慢，换这个 rust 开发的，非常快
eval "$(starship init zsh)"

source /usr/local/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/lib/zsh-history-substring-search/zsh-history-substring-search.zsh

setopt auto_cd

# echo $HOME
export JAVA_HOME=/usr/local/jdk8
export M2_HOME=/usr/local/maven
export MAVEN_OPTS="-Xms2g -Xmx4g -XX:ReservedCodeCacheSize=512m"
export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin
export PATH=$PATH:/opt/bin

# cuda
export PATH=$PATH:/usr/local/cuda-12.6/bin
# or /etc/ld.so.conf add /usr/local/cuda-12.6/lib64
# ldconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.6/lib64

# GOPATH
export GOROOT=/usr/local/go
export GOPROXY=https://goproxy.cn
export GOPRIVATE=gitlab.bj.sensetime.com
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/mysql/bin
export GO111MODULE=on

# NODE
export NODE_HOME=/usr/local/node
export PATH=$PATH:$NODE_HOME/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export R_LIBS_USER=/data/R
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
# 4 rJava
export LD_LIBRARY_PATH=/usr/local/jdk8/jre/lib/amd64/server:$LD_LIBRARY_PATH

export PATH=$PATH:/usr/local/pgsql/bin

# huggingface
export HF_HOME=/data2/.cache/huggingface

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
  . "$HOME/.local/bin/env"
fi
# eval 'dircolors ~/.dircolors'

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias tmux="tmux -2"
alias conda-b="conda activate base"

alias start_gopls="gopls serve -listen=127.0.0.1:60098 -logfile=/tmp/gopls-server.log -debug=127.0.0.1:60099"

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

# ag='sudo apt'，与 /usr/bin/ag 冲突
# unalias ag

# 给 yaegi 添加 history 和命令行编辑
alias yaegi='rlwrap yaegi'

bindkey -v

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# fix: Vi-mode: Backspace not working as expected in insert mode
bindkey "^?" backward-delete-char

# home & end
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# Avoid "zsh: no matches found: xxxx"
unsetopt nomatch

alias k=/usr/local/bin/kubectl
alias kf="/usr/local/bin/kubectl --grace-period=0 --force --wait=false"

if [ $commands[kubectl]  ]; then
  source <(kubectl completion zsh)
fi

export KUBECONFIG=$HOME/.kube/config

if [ $commands[helm]  ]; then
  source <(helm completion zsh)
fi

if [ $commands[golangci-lint]  ]; then
  source <(golangci-lint completion zsh)
fi

# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1

[[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh

# 用于更新 toolchain
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
# 用于更新 rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup

export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share

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

export PATH=$PATH:/data/git_m/docker_test/bash_hello/tools

export PATH="/opt/miniforge3/bin:$PATH"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/opt/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

