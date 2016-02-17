
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
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
ENABLE_CORRECTION="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ubuntu history-substring-search github gradle zsh-syntax-highlighting tmux tmuxinator vi-mode autojump) 
# User configuration

export USR_SERVER=/home/yuzx/server
export JAVA_HOME=$USR_SERVER/jdk8
export ANT_HOME=$USR_SERVER/ant
export GRADLE_HOME=$USR_SERVER/gradle
export GROOVY_HOME=$USR_SERVER/groovy
export SCALA_HOME=$USR_SERVER/scala
export SBT_HOME=$USR_SERVER/sbt
# -XX:MaxPermSize=256M
export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled"
export MAVEN_HOME=$USR_SERVER/maven
# export MAVEN_OPTS="-Xms256m -Xmx512m"
export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m"
export HADOOP_PREFIX=$USR_SERVER/hadoop
export HBASE_HOME=$USR_SERVER/hbase
export SPARK_HOME=$USR_SERVER/spark
export KAFKA_HOME=$USR_SERVER/kafka
export ZOOKEEPER_HOME=$USR_SERVER/zookeeper
export GOROOT=/usr/local/go
export NODE_HOME=$USR_SERVER/node
export NODE_PATH=$NODE_HOME/lib/node_modules
export PATH=$PATH:$USR_SERVER/bin:$USR_SERVER/sbin:$NODE_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$USR_SERVER/lib
export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin
export PATH=$PATH:$SCALA_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$KAFKA_HOME/bin
export PATH=$PATH:$SBT_HOME/bin
export PATH=$PATH:$ZOOKEEPER_HOME/bin
export PATH=$PATH:$HBASE_HOME/bin
export PATH=$PATH:/usr/local/go/bin
export PKG_CONFIG_PATH=$USR_SERVER/lib/pkgconfig:$PKG_CONFIG_PATH

umask 0000

# export TERM=screen-256color       # for a tmux -2 session (also for screen)

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
# eval 'dircolors ~/.dircolors'

source $ZSH/oh-my-zsh.sh

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
alias start_redis="redis-server /home/yuzx/etc/redis.conf"
alias start_memcached="memcached -d -m 64 -u root -l 127.0.0.1 -p 12111 -c 1024"
alias stop_mysql="mysqladmin -u root -pmysql1 shutdown"
alias start_zk="zkServer.sh start"
alias stop_zk="zkServer.sh stop"
alias start_hbase="start-hbase.sh"
alias stop_hbase="stop-hbase.sh"
alias start_kafka="cd ~/server/kafka; bin/kafka-server-start.sh -daemon config/server.properties"
alias stop_kafka="cd ~/server/kafka; bin/kafka-server-stop.sh"

bindkey -v

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

