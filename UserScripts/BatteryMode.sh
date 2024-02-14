#!/bin/bash

notif="$HOME/.config/swaync/images/bell.png"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

#figure out some way to give this script sudo permissions so i can turn off nvidia gpu :)

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:passes 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0;\
	misc:vfr true;\
        keyword monitor eDP-1, 2560x1440@60, 0x0, 1.33333333;
	"

    swww kill 
    notify-send -e -u low -i "$notif" "Battery Mode Enabled"
    exit
else
	swww init && swww img "$HOME/.config/rofi/.current_wallpaper"
	sleep 0.1
	${SCRIPTSDIR}/PywalSwww.sh
	sleep 0.5
	${SCRIPTSDIR}/Refresh.sh	 
    notify-send -e -u normal -i "$notif" "Battery Mode Disabled."
    exit
fi
hyprctl reload
