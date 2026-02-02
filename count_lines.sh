#!/bin/bash
# count_lines.sh - Counts lines in .txt files
# Authors: David Velásquez, Jesús Pinzón
# SPTI Lab 2

# First argument is the directory to scan, defaults to home directory if not provided
BASE_DIR="${1:-$HOME}"

# Second argument is optional output file to save results
OUTPUT_FILE="$2"

echo "Counting lines in .txt files..."
echo "Directory: $BASE_DIR"
echo "-----------------------------------------"

# Find all .txt files recursively, count lines in each, sort by count, and display
# - find: searches for .txt files in the directory
# - 2>/dev/null: hides permission denied errors
# - wc -l: counts lines in each file
# - sort -n: sorts numerically (ascending)
# - printf: formats output with aligned columns
# - tee: outputs to screen and optionally to file
find "$BASE_DIR" -name "*.txt" -type f 2>/dev/null | while read file; do
    lines=$(wc -l < "$file")
    echo "$lines $file"
done | sort -n | while read count path; do
    printf "%5d lines: %s\n" "$count" "$path"
done | tee ${OUTPUT_FILE:+$OUTPUT_FILE}

echo "-----------------------------------------"
echo "Done!"
