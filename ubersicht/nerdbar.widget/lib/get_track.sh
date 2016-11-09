#!/bin/bash

check=`ps -ef | grep "/usr/local/bin/mopidy" | grep -v "grep" | wc -l | cut -d " " -f8`

if [ $check -eq 1 ]; then
   track_string=(/usr/local/bin/mpc current --format '%artist% - %title%')
   echo $track_string
else
    echo ""
fi
