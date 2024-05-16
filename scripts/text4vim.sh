#!/bin/sh

sleep 0.5 && /Users/cbm/scripts/text.sh "$1" "$2" "$3" 1>/dev/null 2>/dev/null 3>/dev/null &
osascript <<EOF 
tell application "System Events" 
  keystroke return 
end tell 
EOF
