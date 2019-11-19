#!/bin/bash

# Script to set up all the configs related to the keyboard during i3's startup.
# Written here in sequence instead of as multiple exec statements in the
# i3/config file because that seems to be run in parallel and some commands
# interfere with the others.

# Set key repetition
xset r rate 250 60

# Set English and Spanish layouts, rotate with Win + Space
setxkbmap -layout us,es -option 'grp:win_space_toggle'

# Disable caps lock & set as escape
xmodmap -e "clear lock" -e "keysym Caps_Lock = Escape"
