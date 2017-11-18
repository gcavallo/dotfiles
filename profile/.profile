# ~/.profile: executed by the command interpreter for login shells.

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Default applications
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="chromium"
export BROWSERCLI="w3m"

# WINE
export WINEARCH="win32"
export WINEPREFIX="$HOME/Windows"

# JRE
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
