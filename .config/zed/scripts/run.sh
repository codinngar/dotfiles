#!/bin/bash

# Get the full path of the current file from Zed
full_path="$ZED_FILE"

# Extract the filename and extension
filename_ext=$(basename "$full_path")
extension="${filename_ext##*.}"
filename="${filename_ext%.*}"

# Run commands based on file extension
case "$extension" in
    "cpp")
        g++ "$full_path" -o "$filename" && ./"$filename"
        ;;
    "java")
        mkdir -p target && javac -d target "$full_path" && java -cp target "${filename}"
        ;;
    *)
        echo "Unsupported file extension: $extension"
        ;;
esac
