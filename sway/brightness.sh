#!/bin/sh

case $1 in
"up")
    DIR="-A"
;;
"down")
    DIR="-U"
;;
*)
    exit
;;
esac

pkexec brillo $DIR $2
