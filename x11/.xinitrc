#!/bin/sh

# Set terminal
export TERMINAL=st

# https://wiki.archlinux.org/index.php/Fcitx
# Alternate input method environment variables installation 
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

case "$TERMINAL" in
	"urxvtc")
		# start uxrvt daemon
		urxvtd -q -f -o &
esac

# Set editor
export EDITOR=nvim

# Turn off laptop monitor
xrandr --output eDP-1 --off

# Position laptop monitor screen
xrandr --output eDP-1 --auto --right-of HDMI-1

# Set main monitor to 120 Hz
# xrandr --output HDMI-1 --mode 1920x1080R
xrandr --output HDMI-1 --primary

# disable screen sleeping
xset s off -dpms &

# Outdated. Using xkbcomp
# autokey-gtk &

# # Start sxhkd
# sh /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
# systemctl --user start sxhkd

# # # I want to use Alt_R for other programs and for only the wm to only use Alt_L
# # # [ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap &
# # Better option: use xkbmap
[ -f ~/.xkb/keymap/local ] && xkbcomp ~/.xkb/keymap/local $DISPLAY &

# The ARCH wiki told me to put this in if I have a .Xresources
[ -f ~/.Xresources ] && xrdb -I$HOME ~/.Xresources &

# Compositor settings
# Too laggy with nvidia drivers
# picom --config ~/.config/compton.conf -b &

#### Solid color background settings (compton defaults to grey)
### hsetroot -solid "#000000"

# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
wal -R

# Start printing service
# gksudo service cups start

# Actually start wm. Must be last (other than Xsession)
[ -z $WM ] && WM=i3
echo $WM

[ $WM = 'i3' ] && exec i3

[ $WM = 'bspwm' ] && exec bspwm

[ $WM = 'dwm' ] && 
. ~/scripts/startwm

unset $WM

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession
