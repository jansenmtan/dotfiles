#!/bin/sh

# Set terminal
export TERMINAL=kitty

case "$TERMINAL" in
	"urxvtc")
		# start uxrvt daemon
		urxvtd -q -f -o &
esac

# Set editor
export EDITOR=nvim

# I want to use Alt_L for other programs and for i3 to only use Alt_R
xmodmap -e 'remove mod1 = Alt_L'
xmodmap -e 'add mod3 = Alt_L'

# The ARCH wiki told me to put this in if I have a .Xresources
[ -f ~/.Xresources ] && xrdb -I$HOME ~/.Xresources

# Compositor settings
compton -b 

#### Solid color background settings (compton defaults to grey)
### hsetroot -solid "#000000"

# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
wal -R

# Start printing service
gksudo service cups start

# Actually start i3. Must be last (other than Xsession)
exec i3

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession
