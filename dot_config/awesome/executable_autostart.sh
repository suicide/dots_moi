#!/bin/bash
## runs on each start of awesome

## setup monitors
xrandr --output DisplayPort-0 --auto --output DVI-D-0 --right-of DisplayPort-0 --auto --output HDMI-A-0 --auto --same-as DisplayPort-0

# set compose key to menu
setxkbmap -option compose:menu

# start picom
DISPLAY=":0" picom -b

