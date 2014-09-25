#!/bin/bash 

# rm files to ~/.tmp directory

# define the location to store deleted files
backupdir="$HOME/.tmp"

# print usage
if [ -z "$1" ]; then
  echo "Usage: $(basename "$0") [filename]...   \"remove files"
  echo "       $(basename "$0") -c              \"clean trash files"
  exit 1
fi

# check backupdir existence
[ ! -e "$backupdir" ] && mkdir -p "$backupdir"

# if specified, then clean the trash files
if [ $1 == "-c" ]; then
  rm -rf $backupdir/* $backupdir/.[^.]*
  exit 0
fi

# start loop
while [ $# -ge 1 ]; do
  frompath="$1"
  topath="$backupdir/$(basename "$1").bak"

  ## continue if frompath do not exist
  #[ ! -e "$frompath" ] && shift && continue

  # if topath exist, add numerical suffix
  cnt=1
  while [ -e "$topath" ]; do
    topath="$backupdir/$(basename "$1").$cnt.bak"
    cnt=$[$cnt+1]
  done

  # check whether the parent dir is writable
  if [ -w "$(dirname "$frompath")" ]; then
    mv "$frompath" "$topath"
  else
    sudo mv "$frompath" "$topath"
  fi

  shift
done

# vim:ts=2:sw=2:
