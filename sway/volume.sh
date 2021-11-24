#!/bin/sh

case $1 in
"up")
    DIR="--increase"
;;
"down")
    DIR="--decrease"
;;
"mute")
    DIR="--toggle-mute"
;;
*)
    exit
;;
esac

pamixer --allow-boost $DIR $2
