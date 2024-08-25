#!/bin/bash

input_file="$1"

if [ ! -f "$input_file" ]; then
    echo "Error: File $input_file does not exist."
    exit 1
fi

# Install fswatch if not already installed
if ! command -v fswatch &> /dev/null; then
    echo "fswatch is not installed. Attempting to install using Homebrew..."
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi
    brew install fswatch
fi

echo "Watching $input_file for changes..."

fswatch -o "$input_file" | while read f
do
    echo "File changed. Regenerating PDF..."
    ./md_to_pdf.sh "$input_file"
done