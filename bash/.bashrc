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
	PS1='\[\e[32m\]\u\[\e[90m\]@\[\e[33m\]\h\[\e[30m\]\[\e[00m\]\n\[\e[34m\]\w\[\e[90m\]\$\[\e[00m\] '
else
	PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

case "$TERM" in
	xterm*|rxvt*)
		PS1="\e]0;\h\a$PS1"
		# BASE16 Ocean
		BASE16_SHELL=$HOME/.config/base16-shell/
		[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
		;;
	linux)
		# BASE16 Eighties
		/bin/echo -e "
		\e]P02d2d2d
		\e]P1f2777a
		\e]P299cc99
		\e]P3ffcc66
		\e]P46699cc
		\e]P5cc99cc
		\e]P666cccc
		\e]P7d3d0c8
		\e]P8747369
		\e]P9f2777a
		\e]PA99cc99
		\e]PBffcc66
		\e]PC6699cc
		\e]PDcc99cc
		\e]PE66cccc
		\e]PFf2f0ec
		"
		clear
		;;
	*)
		;;
esac

shopt -s checkwinsize

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
