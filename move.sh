#!/bin/bash

PROGRAM="move"
PROGRAM_EXT="sh"
OPERATION="mv"

if [ $1 != "" ]; then
  dir=$1
else
  dir=${PWD}
fi;

dirs_created=0
files_moved=0

echo "Moving files in" $dir "directory."

for file in $dir/*
do
  filename=$(basename "$file")
  extension="${file##*.}"
  name="${filename%.*}"
  
  if [ ! -d "$file" ]; then
    # only files, please
      
    if [ "$extension" != "$PROGRAM_EXT" ]; then
      mkdir -p "$dir""$extension";
      dirs_created=$((dirs_created+1));
    fi;

    if [ "$name" != "$PROGRAM" ]; then
      $OPERATION "$file" "$dir"/"$extension"/"$filename";
      files_moved=$((files_moved+1));
    fi;

  fi;
done

echo "Finished."
echo "Directories created:" $dirs_created
echo "Files moved:" $files_moved