#---------------------------------------------------------------------------------#
### Fixes
export MOZ_USE_XINPUT2=1 # Use pixel-by-pixel touchpad scrolling in Firefox
if [[ $XDG_SESSION_TYPE = 'wayland' ]]; then
	export MOZ_ENABLE_WAYLAND=1 # Use experimental native Wayland support for Firefox and Thunderbird
	export QT_QPA_PLATFORM=wayland # Enable QT wayland plugin
else
	export PLASMA_USE_QT_SCALING=1 # Make Plasma work properly with high DPI scaling on X11
fi
## Below is disabled because it causes firefox to stop antialiasing fonts in wayland for some reason
#export GTK_USE_PORTAL=1 # Try to use native file pickers in GTK programs
#---------------------------------------------------------------------------------#
### Load pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
#---------------------------------------------------------------------------------#
