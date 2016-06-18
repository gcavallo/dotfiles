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

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

case "$TERM" in
	xterm*|rxvt*)
		PS1="\e]0;\h\a$PS1"
		;;
	linux)
		/bin/echo -e "
		\e]P02f1e2e
		\e]P1ef6155
		\e]P248b685
		\e]P3fec418
		\e]P406b6ef
		\e]P5815ba4
		\e]P65bc4bf
		\e]P7a39e9b
		\e]P8776e71
		\e]P9ef6155
		\e]PA48b685
		\e]PBfec418
		\e]PC06b6ef
		\e]PD815ba4
		\e]PE5bc4bf
		\e]PFe7e9db
		"
		clear
		;;
	*)
		;;
esac

shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
