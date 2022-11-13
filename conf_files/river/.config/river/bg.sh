#!/bin/sh

killall -g swaybg
while pgrep -x swaybg > /dev/null; do sleep 1; done
exec swaybg -m fill -i $HOME/.config/river/2.png
