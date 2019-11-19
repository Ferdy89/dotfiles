#!/bin/bash

OVERRIDE="$HOME/bin/i3lock-override.sh"

# Allows a system to use its own custom lock script simply by having it live on
# a ~/bin/i3lock-override.sh executable file
if [ -f "$OVERRIDE" ]; then
  $OVERRIDE
else
  ICON="$HOME/.config/i3/lock.png"
  IMG="$HOME/.cache/i3lock.png"

  # Take a screenshot for our background
  scrot $IMG
  # Pixelate the background
  convert $IMG -scale 10% -scale 1000% $IMG
  # Add the lock-icon
  convert $IMG $ICON -gravity center -composite $IMG
  # Finally run i3lock itself
  i3lock -e -i $IMG
fi
