
#export PS1=`'%n@%B%m%b (git:'_git_ps1')  %# '`
#export RPROMPT="%~"
export VIM_APP_DIR=~/Applications/Tools

# completion stuff, loads custom completions in ~/.zsh/ too
fpath=(~/.zsh/functions $fpath)
autoload -U compinit
compinit

# gather hostnames for ssh
typeset -aU hostnames
hostnames=(
)
[[ -f $HOME/.ssh/known_hosts ]] && hostnames+=(
${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*}
)

# Completion options, oh my!
zstyle ':completion:*:*:ssh:*:hosts' hosts $hostnames 
zstyle ':completion:*:*:ftp:*:hosts' hosts $hostnames
zstyle ':completion:*:hosts' hosts $hostnames
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*:kill:*:processes' command "ps x"

# Vi all the way, man!
bindkey -v

. ~/.zshaliases
. ~/.zshfunctions

chpwd
setopt auto_cd

# environmental stuff
export HISTSIZE=500
export HISTFILE=~/.zsh_history
export SAVEHIST=500
export PATH=/usr/local/brew/bin:/usr/local/brew/sbin:$PATH:/usr/local/bin:/usr/local/mysql/bin:$JBOSS_HOME/bin:$HOME/bin:$GROOVY_HOME/bin:/opt/local/lib/postgresql82/bin:$HOME/bin/jruby/bin:/opt/local/sbin:/usr/local/git/bin:/usr/local/sbin:$MAGICK_HOME/bin
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/"
export PATH=$JAVA_HOME/bin:$PATH
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LSCOLORS=gxfxcxdxbxgggdabagacad
export MANPATH=$MANPATH:/opt/local/share/man
export EDITOR='vim'
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"
export PGOPTIONS='-c client_min_messages=WARNING'
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

if [ ! "$TERM" = "xterm-color" ]
then
   export TERM=xterm-color
fi

# rvm-install added line:
if [[ -s /Volumes/Users/pom/.rvm/scripts/rvm ]] ; then source /Volumes/Users/pom/.rvm/scripts/rvm ; fi
rvmd() {rvm use $1 --default}
