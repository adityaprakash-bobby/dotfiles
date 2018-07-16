#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch upperbar
if xrandr | grep "HDMI-1 connected"; then
	MONITOR=HDMI-1 polybar PolybarTony &
	MONITOR=eDP-1 polybar PolybarTony &
else
	MONITOR=eDP-1 polybar PolybarTony &
fi

echo "Bar launched..."

