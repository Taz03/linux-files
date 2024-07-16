#!/bin/bash

killall -q polybar

polybar bar 2>&1 | tee -a /tmp/polybar.log & disown

if [[ $(xrandr -q | grep 'HDMI-1-0 connected') ]]; then
    polybar bar_external 2>&1 | tee -a /tmp/polybar.log & disown
fi
