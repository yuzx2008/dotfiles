# By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered.
# This results in a very jarring and frustrating transition between modes.
# This can result in issues with other terminal commands that depended on this delay. If you have issues try raising the delay.
export KEYTIMEOUT=10

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="ys"
# ZSH_THEME="agnoster"
DEFAULT_USER="yuzx"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Tmux states this should be screen-256color, but you may need to change it on
# systems without the proper terminfo
ZSH_TMUX_FIXTERM_WITH_256COLOR=true
# auto start tmux
# ZSH_TMUX_AUTOSTART=true
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history-substring-search zsh-syntax-highlighting vi-mode)
# User configuration

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
# swift 4 tensorflow
export PATH=$PATH:/opt/usr/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/lib/pkgconfig
# cuda
export PATH=/usr/local/cuda-8.0/bin:/usr/local/TensorRT-2.1.2/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/extras/CUPTI/lib64:/usr/local/TensorRT-2.1.2/lib:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=/usr/local/hadoop/lib/native:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/yuzx/.rvm/rubies/default/lib:$LD_LIBRARY_PATH
# GOPATH
export GOPROXY=https://goproxy.cn
export GOPRIVATE=gitlab.bj.sensetime.com/diamond/*
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/mysql/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/mysql/lib
export GO111MODULE=on
# texlive 2017
# export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
# export MANPATH=/usr/local/texlive/2017/texmf-dist/doc/man:$MANPATH
# export INFOPATH=/usr/local/texlive/2017/texmf-dist/doc/info:$INFOPATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=$PATH:$HOME/.rvm/bin
export MINIKUBE_HOME=/data2/yuzx
export R_LIBS_USER=/data2/R
export STACK_ROOT=/data2/.stack
export PATH=$PATH:$HOME/.local/bin
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
# 4 rJava
export LD_LIBRARY_PATH=/usr/local/jdk8/jre/lib/amd64/server:$LD_LIBRARY_PATH
# umask 0000

export PATH=$PATH:$HOME/.krew/bin
export PATH=$PATH:/usr/local/libexec

export PATH=$PATH:/usr/lib/x86_64-linux-gnu/libgtk-3-0/gtk-query-immodules-3.0
export PATH=$PATH:/usr/lib/x86_64-linux-gnu/libgtk2.0-0/gtk-query-immodules-2.0
export GTK_PATH=$GTK_PATH:/usr/local/lib/gtk-2.0:/usr/local/lib/gtk-3.0:/usr/local/lib/gtk-4.0
export PATH="/opt/miniconda3/bin:$PATH"

export GTK_DEBUG=modules
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

source $HOME/.cargo/env

# export TERM=screen-256color       # for a tmux -2 session (also for screen)

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
# eval 'dircolors ~/.dircolors'

source $ZSH/oh-my-zsh.sh
# eval "$(starship init zsh)"

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  # export EDITOR='mvim'
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias tmux="tmux -2"
alias start_mysql="cd /usr/local/mysql ; sudo ./bin/mysqld_safe --user=mysql & ; cd -"
alias start_redis="sudo redis-server /etc/redis/redis.conf"
alias start_memcached="memcached -d -m 64 -u root -l 127.0.0.1 -p 12111 -c 1024"
alias stop_mysql="mysqladmin -u root -pmysql1 shutdown"
alias start_zk="zkServer.sh start"
alias stop_zk="zkServer.sh stop"
alias start_hbase="start-hbase.sh"
alias stop_hbase="stop-hbase.sh"
alias start_kafka="cd /usr/local/kafka; bin/kafka-server-start.sh -daemon config/server.properties"
alias stop_kafka="cd /usr/local/kafka; bin/kafka-server-stop.sh"
alias start_zinc="zinc -nailed -start"
alias stop_zinc="zinc -shutdown"
alias start_oozie="/usr/local/oozie/bin/oozied.sh start"
alias stop_oozie="/usr/local/oozie/bin/oozied.sh stop"
alias conda-b="conda activate base"

# alias beeline_n1="/usr/local/hive2/bin/beeline -u \"jdbc:hive2://nn1.dev.ad-hadoop.com:10000/sara_ods;principal=hive/nn1.dev.ad-hadoop.com@DEV.AD-HADOOP.COM\""
# alias beeline_n2="/usr/local/hive2/bin/beeline -u \"jdbc:hive2://nn2.dev.ad-hadoop.com:10000/sara_ods;principal=hive/nn2.dev.ad-hadoop.com@DEV.AD-HADOOP.COM\""
alias beeline_n1="/usr/local/hive2/bin/beeline -n hive -p admin -u \"jdbc:hive2://nn1.dev.ad-hadoop.com:10000/sara_ods\""
alias beeline_n2="/usr/local/hive2/bin/beeline -n hive -p admin -u \"jdbc:hive2://nn2.dev.ad-hadoop.com:10000/sara_ods\""

alias antlr4='java -Xmx512M -cp "/usr/local/lib/antlr-4.9.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx512M -cp "/usr/local/lib/antlr-4.9.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

alias k=/usr/local/bin/kubectl
alias o=/usr/local/bin/opensearch-cli

# ag='sudo apt'，与 /usr/bin/ag 冲突
# unalias ag

bindkey -v

# Use vim cli mode
# bindkey '^P' up-history
# bindkey '^N' down-history

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# bind k and j for VI mode
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# home/end
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# Avoid "zsh: no matches found: xxxx"
# or alias scp='noglob scp'
unsetopt nomatch

# https://github.com/seebi/dircolors-solarized.git
export LS_COLORS='no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.arj=00;38;5;61:*.taz=00;38;5;61:*.lzh=00;38;5;61:*.lzma=00;38;5;61:*.tlz=00;38;5;61:*.txz=00;38;5;61:*.zip=00;38;5;61:*.z=00;38;5;61:*.Z=00;38;5;61:*.dz=00;38;5;61:*.gz=00;38;5;61:*.lz=00;38;5;61:*.xz=00;38;5;61:*.bz2=00;38;5;61:*.bz=00;38;5;61:*.tbz=00;38;5;61:*.tbz2=00;38;5;61:*.tz=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.rar=00;38;5;61:*.ace=00;38;5;61:*.zoo=00;38;5;61:*.cpio=00;38;5;61:*.7z=00;38;5;61:*.rz=00;38;5;61:*.apk=00;38;5;61:*.gem=00;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=00;38;5;245:*.rdf=00;38;5;245:*.owl=00;38;5;245:*.n3=00;38;5;245:*.ttl=00;38;5;245:*.nt=00;38;5;245:*.torrent=00;38;5;245:*.xml=00;38;5;245:*Makefile=00;38;5;245:*Rakefile=00;38;5;245:*Dockerfile=00;38;5;245:*build.xml=00;38;5;245:*rc=00;38;5;245:*1=00;38;5;245:*.nfo=00;38;5;245:*README=00;38;5;245:*README.txt=00;38;5;245:*readme.txt=00;38;5;245:*.md=00;38;5;245:*README.markdown=00;38;5;245:*.ini=00;38;5;245:*.yml=00;38;5;245:*.cfg=00;38;5;245:*.conf=00;38;5;245:*.h=00;38;5;245:*.hpp=00;38;5;245:*.c=00;38;5;245:*.cpp=00;38;5;245:*.cxx=00;38;5;245:*.cc=00;38;5;245:*.objc=00;38;5;245:*.sqlite=00;38;5;245:*.go=00;38;5;245:*.sql=00;38;5;245:*.csv=00;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.opus=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=00;38;5;166:*.MOV=00;38;5;166:*.mpg=00;38;5;166:*.mpeg=00;38;5;166:*.m2v=00;38;5;166:*.mkv=00;38;5;166:*.ogm=00;38;5;166:*.mp4=00;38;5;166:*.m4v=00;38;5;166:*.mp4v=00;38;5;166:*.vob=00;38;5;166:*.qt=00;38;5;166:*.nuv=00;38;5;166:*.wmv=00;38;5;166:*.asf=00;38;5;166:*.rm=00;38;5;166:*.rmvb=00;38;5;166:*.flc=00;38;5;166:*.avi=00;38;5;166:*.fli=00;38;5;166:*.flv=00;38;5;166:*.gl=00;38;5;166:*.m2ts=00;38;5;166:*.divx=00;38;5;166:*.webm=00;38;5;166:*.axv=00;38;5;166:*.anx=00;38;5;166:*.ogv=00;38;5;166:*.ogx=00;38;5;166:';

# export PATH=/usr/local/cuda-9.2/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64:$LD_LIBRARY_PATH

# export HTTP_PROXY="http://myproxy.server.com:8080/"
# export HTTPS_PROXY="https://172.16.1.221:3128/"
# export FTP_PROXY="http://myproxy.server.com:8080/"
# export NO_PROXY="localhost,127.0.0.1"

# or Or when using Oh-My-Zsh, edit the ~/.zshrc file and update the plugins= line to include the kubectl plugin.
# if [ $commands[kubectl]  ]; then
#     source <(kubectl completion zsh)
# fi

# source <(golangci-lint completion zsh)

export KUBECONFIG=$HOME/.kube/config
# export GIT_TRACE_PACKET=1
# export GIT_TRACE=1
# export GIT_CURL_VERBOSE=1

[[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh
# autoload -U compinit && compinit -u

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /home/yuzx/go/bin/mc mc

# 用于更新 toolchain
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# 用于更新 rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share

# export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_TIME=en_US.UTF-8
#export LC_MESSAGES=en_US.UTF-8
#export LC_NAME=en_US.UTF-8

export NO_PROXY="*.sensetime.com"

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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/yuzx/go/bin/mc mc
