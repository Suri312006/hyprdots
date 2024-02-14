#!/bin/bash

CONFIG="$HOME/.config/swaylock/config"

/home/suri312006/.config/hypr/scripts/MediaCtrl.sh --stop
pamixer -m
sleep 0.5s 
pids=$(ps ax | grep '/usr/share/discord/resources/app.asar' | grep -v grep | awk '{print $1}')
read -a array <<< "$pids" 
echo "$array"
kill $array
swaylock --config ${CONFIG} & disown
