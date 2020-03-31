#!/bin/sh
cd ~/Notes
fp=$(find . -type f -name '*.md' | rofi -dmenu -i -p 'open a note')
if [ -n "$fp" ]; then
  ~/.local/bin/term -e $EDITOR "$fp"
fi
