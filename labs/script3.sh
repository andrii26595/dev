#!/bin/bash

directory=""
text=""

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -p|--path)
            directory="$2"
            shift
            shift
            ;;
        -s|--string)
            text="$2"
            shift
            shift
            ;;
        *)
            echo "Невідомий ключ: $1"
            exit 1
            ;;
    esac
done

if [ -z "$directory" ] || [ -z "$text" ]; then
    echo "Потрібно ввести ключі -p для шляху та -s для тексту"
    echo "Приклад використання: ./script.sh -p шлях -s текст"
    exit 1
fi

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
