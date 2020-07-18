#!/bin/bash
## runs on each start of awesome

## setup monitors
xrandr --output DP-1 --auto --output DVI-D-1 --right-of DP-1 --auto --output HDMI-1 --auto --same-as DP-1

# start picom
DISPLAY=":0" picom -b

