#!/bin/bash

# Script to replace all instances of <div style="text-align: center"> with <div class="text-center">
# This helps maintain consistency and follows the project's CSS best practices

# List of files to process
FILES=(
  "/Users/mj/code/evil1.org/unfiltered/new.md"
  "/Users/mj/code/evil1.org/unfiltered/i-want-you-to-become-my-expert-oHXQUODjR52ajGx6TrVUYg.md"
  "/Users/mj/code/evil1.org/trainings/global_ascension_initiatives_association.md"
)

# Perform the replacement
for file in "${FILES[@]}"; do
  echo "Processing file: $file"
  sed -i '' 's/<div style="text-align: center">/<div class="text-center">/g' "$file"
  
  # Check if sed command was successful
  if [ $? -eq 0 ]; then
    echo "✅ Successfully updated $file"
  else
    echo "❌ Failed to update $file"
  fi
done

echo "All files processed."
