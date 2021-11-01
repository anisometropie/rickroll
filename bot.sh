#!/bin/bash
input=$1

printChar () {
  printf "$1" | xclip -i -selection clipboard
  xdotool key --clearmodifiers "ctrl+v"
}

minimumLength=50
printLine () {
  local line=$1
  local trailingLength=$(($minimumLength - ${#line}))
  local trailingSpaces=$(head -c "$trailingLength" < /dev/zero | tr '\0' ' ')
  line="$line$trailingSpaces"
  for (( i=0; i<${#line}; i++ )); do
    char=${line:$i:1}
    printChar "$char"
    ((count++))
    sleep 0.001
  done
}

count=0

while IFS= read -r line; do
  printLine "$line"
  printChar "\n"
  while [ $count -gt 0 ]; do
    echo $count
    xdotool key Left
    ((count--))
    sleep 0.001
  done
done < $input

