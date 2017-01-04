# ~/.profile: executed by the command interpreter for login shells.

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
	gpg-connect-agent /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# Desktop
export DE="" # empty for xdg-open to respect mimeapps.list
export XDG_MENU_PREFIX="lxde-"
export XDG_CURRENT_DESKTOP="OpenBox"
export DESKTOP_SESSION="gnome" # required for gtk icons in qt4

# Default applications
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="chromium"
export BROWSERCLI="w3m"

# WINE
export WINEARCH="win32"
export WINEPREFIX="$HOME/Windows"

# GTK
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# QT
export QT_QPA_PLATFORMTHEME="qt5ct"

# JRE
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
