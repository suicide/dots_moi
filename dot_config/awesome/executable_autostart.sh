#!/bin/bash
## runs on each start of awesome

## setup monitors
xrandr --output DisplayPort-0 --auto --output DVI-D-0 --right-of DisplayPort-0 --auto --output HDMI-A-0 --auto --same-as DisplayPort-0

# start picom
DISPLAY=":0" picom -b

