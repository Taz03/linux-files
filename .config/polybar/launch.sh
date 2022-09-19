#!/bin/bash

killall -q polybar

polybar bar 2>&1 | tee -a /tmp/polybar.log & disown
