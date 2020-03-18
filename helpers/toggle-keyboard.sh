#!/bin/sh
CURRENT=`setxkbmap -query | grep layout | cut -d ":" -f 2 | sed 's/^[ ]*//g'`

case "$CURRENT" in
	"hu")
		TARGET="us"
		;;
	"us")
		TARGET="hu"
		;;
	*)
		TARGET="us"
		;;
esac
echo "$CURRENT => $TARGET"
setxkbmap $TARGET
