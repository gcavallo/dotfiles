# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

###########
# History #
###########

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

##########
# Prompt #
##########

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

DN=$(hostname -d)

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u\[\033[01;30m\]@\[\033[01;33m\]\h\[\033[01;30m\].\[$DN\]\n\[\033[01;34m\]\w`[[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working directory clean" ]] && echo "\[\e[32m\]" || echo "\[\e[31m\]"`$(__git_ps1 " %s\[\e[00m\]")\[\033[01;30m\]\$\[\033[00m\] '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#########
# xterm #
#########

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

shopt -s checkwinsize

#########
# Alias #
#########

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ll='ls -alh'
alias sudo='sudo '
alias vi='vim'
alias lsblk='lsblk -o NAME,TYPE,KNAME,FSTYPE,MOUNTPOINT,LABEL,UUID,OWNER,GROUP,MODE,TYPE,SIZE'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
