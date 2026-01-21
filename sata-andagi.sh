#!/bin/bash

sound_dir="./Sata Andagi.mp3"
min_sleep=60  # 1 min
max_sleep=300 # 5 min

mpv --no-terminal --no-video "$sound_dir" # play immediately

while true; do
  sleep $((RANDOM % (max_sleep - min_sleep + 1) + min_sleep))
  mpv --no-terminal --no-video "$sound_dir"
done