#!/bin/bash

char="█"
input="rick"

count=0
while read -N1 char; do
  printf "$char" | xclip -i -selection clipboard
  xdotool key --clearmodifiers "ctrl+shift+v"
  if [[ $char == *$'\n'* ]]; then
    while [ $count -gt 0 ]; do
      echo $count
      xdotool key Left
      ((count--))
      sleep 0.01
    done
  else 
    ((count++))
  fi

  sleep 0.01
done < $input

