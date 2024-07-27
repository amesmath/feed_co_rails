#!/bin/bash

# Array of directories to search for Ruby files
directories=("app/models" "app/controllers" "app/helpers" "app/mailers" "app/jobs" "app/channels")

# Loop through each directory and process each Ruby file
for dir in "${directories[@]}"; do
    for file in $(find $dir -name "*.rb"); do
    echo "Generating RBS for $file"
    bundle exec rbs prototype rb "$file"
  done
done
