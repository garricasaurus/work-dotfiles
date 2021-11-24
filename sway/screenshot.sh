#!/bin/sh

if [ "$1" == "-g" ]; then
    ARG_REGION="-g `slurp`"
fi

TS=`date +"%Y-%m-%d %H:%M:%S"`
grim "$ARG_REGION" "$HOME/Screenshots/Screenshot_$TS.png"
