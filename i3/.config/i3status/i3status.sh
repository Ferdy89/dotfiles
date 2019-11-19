#!/bin/bash

# shell script to prepend i3status with more stuff

i3status | while :
do
  read line

  # 2019 Nov: Values ending in 2 were observed in Invidia
  case "$(xset -q|grep LED|awk '{ print $10 }')" in
    "00000000"|"00000002") KBD="EN" ;;
    "00001000"|"00001002") KBD="ES" ;;
    *) KBD="unknown" ;;
  esac

  kbd_line="[{ \"full_text\": \"⌨️ $KBD\", \"separator\":true, \"separator_block_width\": 6 }"
  echo "${line/[/$kbd_line,}" || exit 1
done
