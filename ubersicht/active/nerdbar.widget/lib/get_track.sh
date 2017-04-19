#!/bin/bash

check=`ps -ef | grep "/usr/local/opt/mopidy/bin/mopidy" | grep -v "grep" | wc -l | cut -d " " -f8`

if [ $check -eq 1 ]; then
   track_string=$(/usr/local/bin/mpc current --format '%artist% - %title%')
   track_status=$(/usr/local/bin/mpc | sed -n 's/^.*\[\([a-z+]*\)\].*$/\1/p')
   echo "$track_string@$track_status"
else
    echo ""
fi
