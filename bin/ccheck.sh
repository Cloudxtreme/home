#!/bin/bash
#===============================================================================
#      FILENAME: code_check.sh
#   DESCRIPTION: ---
#         NOTES: ---
#        AUTHOR: leoxiang, leoxiang727@qq.com
#      REVISION: 2015-06-22 by leoxiang
#===============================================================================

function usage
{
  echo "usage: $(basename $0) [dir]"
}

function process
{
  vim $@ <<EOF
:let g:ycm_auto_trigger=0
:argdo :ClangFormat
:argdo :FixWhitespace
:wqa
EOF
}

# input
[ -z "$1" ] && usage && exit

# group
var_files="`find "$1" -name "*.hpp" -or -name "*.cpp" -or -name "*.c" -or -name "*.h"`"

# execute
var_cnt=0
var_file=""

for _file in $var_files; do

  var_cnt=$((var_cnt+1))
  var_file="$var_file $_file"

  if [ $var_cnt -ge "30" ]; then
    process "$var_file"
    var_cnt=0
    var_file=""
  fi
done

process $var_file

# vim:ts=2:sw=2:et:ft=sh:
