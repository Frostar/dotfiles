#! /usr/bin/env bash
aerospace list-windows --all --json | jq -r '.[] | select(.["window-title"] == "Spotify MiniPlayer") | .["window-id"]'