#!/bin/bash
# Grep current track ID
SONGID=$(mpc current --format '%file%' | cut -f3- -d':')
# echo $SONGID

# Curl Track Info, grep url for images, take the first one, cut url between 3th " and 4th "
curl -s -X GET "https://api.spotify.com/v1/tracks/$SONGID" | grep "\"url\" : \"https://i.scdn.co/image/" | head -1 | cut -d "\"" -f4 | cut -d "\"" -f1
