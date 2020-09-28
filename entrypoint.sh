#!/bin/sh -l

echo "Folder 1: $1"
echo "Folder 2: $2"
echo "Output: $3"

/usr/bin/env Rscript compare-folders.R "$1" "$2"

echo "Done."
