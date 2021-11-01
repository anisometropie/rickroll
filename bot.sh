#!/bin/bash
input=$1

printChar () {
  printf "$1" | xclip -i -selection clipboard
  xdotool key --clearmodifiers "ctrl+v"
}

count=0
while IFS= read -r line; do
  for (( i=0; i<${#line}; i++ )); do
    char=${line:$i:1}
    printChar "$char"
    ((count++))
    sleep 0.001
  done
  printChar "\n"
  while [ $count -gt 0 ]; do
    echo $count
    xdotool key Left
    ((count--))
    sleep 0.001
  done
done < $input

