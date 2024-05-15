#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Потрібно ввести шлях і текст як аргументи"
    echo "Приклад використання: ./script.sh шлях текст"
    exit 1
fi


directory=$1
text=$2


if [ ! -d "$directory" ]; then
    echo "Директорія не існує"
    exit 1
fi


files=$(grep -lir "$text" "$directory")

if [ -z "$files" ]; then
    echo "Файлів, що містять текст '$text' у директорії $directory, не знайдено"
else
    echo "Файли, що містять текст '$text' у директорії $directory:"
    echo "$files"
fi
