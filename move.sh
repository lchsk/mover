#!/bin/bash

PROGRAM="move"
PROGRAM_EXT="sh"
OPERATION="mv"

dir=${PWD}
dirs_created=0
files_moved=0

for file in $dir/*
do
  filename=$(basename "$file")
  extension="${file##*.}"
  filename="${filename%.*}"
  
  if [ ! -d "$file" ]; then
    # only files, please
      
    if [ "$extension" != "$PROGRAM_EXT" ]; then
      mkdir -p $extension;
      dirs_created=$((dirs_created+1));
    fi;

    if [ "$filename" != "$PROGRAM" ]; then
      $OPERATION "$file" "$extension"/"$filename";
      files_moved=$((files_moved+1));
    fi;

  fi;
done

echo "Finished."
echo "Directories created:" $dirs_created
echo "Files moved:" $files_moved