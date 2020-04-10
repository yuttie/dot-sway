#!/bin/sh
cd ~/Notes
fp=$(find . -type f -regextype egrep -regex '.*\.(md|org|rst|asciidoc|adoc|txt)$' | sed -e 's!\./!!' | rofi -dmenu -i -p 'open a note')
if [ -n "$fp" ]; then
  ~/.local/bin/term -e $EDITOR "$fp"
fi
