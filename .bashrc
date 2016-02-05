# ~/.bashrc: executed by bash(1) for non-login shells.

[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='\[\e[01;32m\]\u\[\e[01;30m\]@\[\e[01;33m\]\h\[\e[01;30m\]\[\e[00m\]\n\[\e[01;34m\]\w\[\e[01;30m\]\$\[\e[00m\] '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
	xterm*|rxvt*)
		PS1="\e]0;\h\a$PS1"
		;;
	*)
		;;
esac

shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
