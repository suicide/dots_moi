#!/bin/bash
## runs on each start of awesome

## setup monitors
xrandr --output DVI-D-0 --auto --output HDMI-1-2 --left-of DVI-D-0 --auto --output HDMI-0 --auto --same-as HDMI-1-2

# start picom
DISPLAY=":0" picom -b

