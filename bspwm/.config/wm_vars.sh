#!/bin/sh

. $HOME/.cache/wal/colors.sh
screen_width=`xrandr | grep '*' | grep -oE '[0-9]+' | sed -n 1p`
screen_height=`xrandr | grep '*' | grep -oE '[0-9]+' | sed -n 2p`
border_width=2
window_gap=6
bar_height=27
