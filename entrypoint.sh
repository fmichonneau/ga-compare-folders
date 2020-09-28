#!/bin/sh -l
set -e


if [ -z "$FOLDER_1" ]; then
    echo "FOLDER_1 is not set. Quitting."
    exit 1
fi


if [ -z "$FOLDER_2" ]; then
    echo "FOLDER_2 is not set. Quitting."
    exit 1
fi


if [ -z "$OUTPUT" ]; then
    echo "OUTPUT is not set. Quitting."
    exit 1
fi


echo "Folder 1: ${FOLDER_1}"
echo "Folder 2: ${FOLDER_2}"
echo "  Output: ${OUTPUT}"

sh -c "/usr/bin/env Rscript compare-folders.R ${FOLDER_1} ${FOLDER_2} ${OUTPUT}"

echo "Done."
