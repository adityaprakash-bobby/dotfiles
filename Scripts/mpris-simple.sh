#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
	echo " $(cmus-remote -C status | grep file | gawk -F/ '{print $5}')"
elif [ "$player_status" = "Paused" ]; then
    echo " $(cmus-remote -C status | grep file | gawk -F/ '{print $5}')"
else
    echo " $(cmus-remote -C status | grep file | gawk -F/ '{print $5}')"
fi
