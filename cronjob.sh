#!/bin/bash

log_file="/var/log/my-app.log"

file_size=$(stat -c %s "$log_file")
last_modified=$(stat -c %y "$log_file")

previous_size=$(redis-cli GET my-app:file_size)
previous_modified=$(redis-cli GET my-app:last_modified)

if [ "$file_size" -ne "$previous_size" ] || [ "$last_modified" != "$previous_modified" ]; then
    redis-cli SET my-app:file_size "$file_size"
    redis-cli SET my-app:last_modified "$last_modified"
fi
