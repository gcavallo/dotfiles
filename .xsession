# Mouse constant deceleration
xinput set-prop 9 262 1

# Mouse adaptive deceleration
xinput set-prop 9 263 8

# Mouse velocity scaling (1000 / update frequency)
xinput set-prop 9 264 1

# Desktop
hsetroot -cover "$HOME/.wallpaper"

compton --config ~/.config/compton.conf -b &
pcmanfm -d &

exec openbox-session
