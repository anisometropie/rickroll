#!/bin/bash
input=$1

count=0
while IFS= read -r line; do
  for (( i=0; i<${#line}; i++ )); do
    char=${line:$i:1}
    printf "$char" | xclip -i -selection clipboard
    xdotool key --clearmodifiers "ctrl+v"
    ((count++))
    sleep 0.001
  done
  printf "\n" | xclip -i -selection clipboard
  xdotool key --clearmodifiers "ctrl+v"
  while [ $count -gt 0 ]; do
    echo $count
    xdotool key Left
    ((count--))
    sleep 0.001
  done
done < $input

