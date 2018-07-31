#!/bin/bash

if xrandr | grep "HDMI-1 connected"; then
	xrandr --output eDP-1 --mode 1366x768 
	xrandr --output HDMI-1 --mode 1280x1024 --left-of eDP-1
fi


