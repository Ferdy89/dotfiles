#!/bin/bash

# Create a local file at ~/.config/i3/i3display-override.sh and include there any
# machine-specific config for an extra monitor, for example
#   xrandr --output HDMI1 --auto --right-of eDP1

OVERRIDE="$HOME/.config/i3/i3display-override.sh"

if [ -f "$OVERRIDE" ]; then
  $OVERRIDE
fi
