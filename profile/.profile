# ~/.profile: executed by the command interpreter for login shells.

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Default applications
export DE="lxde"
export XDG_MENU_PREFIX="lxde-"
export XDG_CURRENT_DESKTOP="LXDE"
export DESKTOP_SESSION="LXDE"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="chromium"
export BROWSERCLI="w3m"

# WINE
export WINEARCH="win32"
export WINEPREFIX="$HOME/Windows"

# QT
export QT_QPA_PLATFORMTHEME="qt5ct"

# X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
