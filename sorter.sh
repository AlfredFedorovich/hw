#!/bin/sh


if [ -z "$1" ]; then
$1="."
  else
    if [ ! -d "$1" ]; then
      echo "Ошибка: каталог '$1' не существует"
      exit 1
    else
      dir="$1"
    fi
fi
find "$1" -type f -exec du -h {} + | sort -nr
