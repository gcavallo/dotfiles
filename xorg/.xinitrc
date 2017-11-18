#!/usr/bin/env bash

[[ -f /etc/xprofile ]] && . /etc/xprofile
[[ -f ~/.xprofile   ]] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec openbox-session
