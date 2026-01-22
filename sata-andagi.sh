#!/bin/bash

sound_dir="./Sata Andagi.mp3"
min_sleep=60  # 1 min
max_sleep=300 # 5 min

usage() {
  echo "Usage: $0 [-m min_seconds] [-M max_seconds] [-f audio_file_path]"
  exit 1
}

while getopts ":m:M:f:h" opt; do
  case "$opt" in
    m) min_sleep="$OPTARG" ;;
    M) max_sleep="$OPTARG" ;;
    f) sound_dir="$OPTARG" ;;
    h) usage ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
    esac
done

mpv --no-terminal --no-video "$sound_dir" # play immediately

while true; do
  sleep $((RANDOM % (max_sleep - min_sleep + 1) + min_sleep))
  mpv --no-terminal --no-video "$sound_dir"
done
