#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Потрібно ввести шлях і принаймні одне розширення файлів як аргументи"
    echo "Приклад використання: ./script.sh шлях розширення1 [розширення2 ...]"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Директорія не існує"
    exit 1
fi

shift

for extension in "$@"; do
    files=$(find "$directory" -type f -name "*.$extension")
    if [ -z "$files" ]; then
        echo "Файлів з розширенням .$extension не знайдено у директорії $directory"
    else
        echo "Файли з розширенням .$extension у директорії $directory:"
        echo "$files"
    fi
done
