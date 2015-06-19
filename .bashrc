# ~/.bashrc: executed by bash(1) for non-login shells.

############################################################
# Common Settings
############################################################
# don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it for setting history
shopt -s histappend

# check the window size after each command 
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# stop mail check
unset MAILCHECK

# not using gnome ask pass
unset SSH_ASKPASS

############################################################
# Interface Settings
############################################################
# set color prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto --time-style=long-iso'
  alias grep='grep --color=auto'
fi

# another way to show colour on manpages
alias man="TERMINFO=~/.terminfo/ LESS=C TERM=xterm PAGER=less man"

############################################################
# Edit Settings
############################################################
# leo's personal alias settings
alias ll='ls -lhFv --group-directories-first'
alias la='ll -A'
alias l='ll'
alias c='clear'
alias vi='vim'
alias gentags='sudo ctags -R --sort=foldcase --c++-kinds=+p --fields=+ianS --extra=+q --language-force=auto .'
alias showerr='cpp -dM /usr/include/errno.h | grep "define E" | sort -n -k 3'

# set default editor
export EDITOR=vim

# set PATH to include sbin
export PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH
export PATH=/usr/local/llvm/bin:$PATH

# set PATH to include my own bin path
export PATH="$HOME/bin:$PATH"

# set locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# tricks: make tmux create from current dir
PS1='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD)'$PS1

## start ssh-agent
#if [ -f ~/.agent.env ]; then
  ## load ssh configuration from .agent.env
  #source ~/.agent.env >/dev/null
  ## find whether the ssh agent process is alive
  #[ ! -z $SSH_AGENT_PID ] && ! kill -0 $SSH_AGENT_PID &>/dev/null && \
    #eval "$(ssh-agent | tee ~/.agent.env)" && \
    #eval ssh-add
  ## find whether the ssh2 agent process is alive
  #[ ! -z $SSH2_AGENT_PID ] && ! kill -0 $SSH2_AGENT_PID &>/dev/null 2>&1 && \
    #eval "$(ssh-agent | tee ~/.agent.env)" && \
    #eval ssh-add 
#else
  ## start a new agent
  #eval "$(ssh-agent | tee ~/.agent.env)"
  #eval ssh-add
#fi

# lbf setting
export PATH="$HOME/bin/lbf:$PATH"
source lbf_init.sh

# vim:ts=2:sw=2:et:ft=sh:
