#!/bin/bash
#===============================================================================
#      FILENAME: lbf_init.sh
#
#   DESCRIPTION: ---
#         NOTES: ---
#        AUTHOR: leoxiang, leoxiang@tencent.com
#       COMPANY: Tencent Co.Ltd
#      REVISION: 2012-05-31 by leoxiang
#===============================================================================

############################################################
# Init Main
############################################################
function lbf_init {
  # set bash opt
  shopt -s expand_aliases
  shopt -s shift_verbose
  shopt -s sourcepath

  # source depend script
  ! source lbf_util.sh    && return 1
  ! source lbf_io.sh      && return 1
  ! source lbf_array.sh   && return 1
  ! source lbf_path.sh    && return 1
  ! source lbf_map.sh     && return 1
  ! source lbf_network.sh && return 1
  ! source lbf_test.sh    && return 1

  # if this is interactive bash, do specified initiation
  [ $0 == "bash" ] && ! lbf_interactive_init && return 1

  # declare lbf version
  io::no_output lbf_version
}

function lbf_interactive_init {
  LBF_SCRIPT_TEMP_SERVER="$(util::find_script temp_server.sh)"
  LBF_SCRIPT_LBF=""
  LBF_SCRIPT_LBF+="$(util::find_script basic_alarm.exe) "
  LBF_SCRIPT_LBF+="$(util::find_script basic_ssh.exp) "
  LBF_SCRIPT_LBF+="$(util::find_script lbf_array.sh) " 
  LBF_SCRIPT_LBF+="$(util::find_script lbf_init.sh) " 
  LBF_SCRIPT_LBF+="$(util::find_script lbf_io.sh) " 
  LBF_SCRIPT_LBF+="$(util::find_script lbf_map.sh) " 
  LBF_SCRIPT_LBF+="$(util::find_script lbf_network.sh) " 
  LBF_SCRIPT_LBF+="$(util::find_script lbf_path.sh) " 
  LBF_SCRIPT_LBF+="$(util::find_script lbf_test.sh) " 
  LBF_SCRIPT_LBF+="$(util::find_script lbf_util.sh) " 

  util::is_empty ${LBF_SCRIPT_TEMP_SERVER} && echo "Cant find LBF_SCRIPT_TEMP_SERVER" && return 1
  util::is_empty ${LBF_SCRIPT_LBF} && echo "Cant find LBF_SCRIPT_LBF" && return 1
  return 0
}

############################################################
# Helper Func
############################################################
function lbf_version {
  export LBF_VERSION="7"
  echo "LBF Current Version: ${LBF_VERSION}"
}

# template-generate function
function lbf_gen_server {
  local var_tl_name="server.sh"
  local var_author="leoxiang"

  read -p "Input script name [${var_tl_name}]: " var_tl_name
  read -p "Input author [${var_author}]: " var_author

  local var_tl_name=${var_tl_name:-server.sh}
  local var_author=${var_author:-leoxiang}

  # copy all scripts
  cp -f ${LBF_SCRIPT_TEMP_SERVER} ${var_tl_name}
  mkdir lbf
  cp -rf ${LBF_SCRIPT_LBF} lbf
  chmod a+x ${var_tl_name}
}

function lbf_help {
  io::red "This is the help for LBF ${LBF_VERSION}: \n"
  io::red "See more help by type command below: \n"
  io::red "\n"
  io::red "[LIB]\n"
  printf '%-30s %s\n' $(io::yellow "util::help")    "provide some useful ultility"
  printf '%-30s %s\n' $(io::yellow "path::help")    "provide path-related operations"
  printf '%-30s %s\n' $(io::yellow "network::help") "provide network-related operations, ssh execute, ssh sopy..."
  printf '%-30s %s\n' $(io::yellow "io::help")      "provide io-related operations, colorful io, log..."
  printf '%-30s %s\n' $(io::yellow "array::help")   "provide abstract data type: array"
  io::red "\n"
  io::red "[COMMAND]\n"
  printf '%-30s %s\n' "$(io::yellow "lbf_version")"     "show lbf version"
  printf '%-30s %s\n' "$(io::yellow "lbf_gen_server")" "generate template for proccess manipulation, including start, stop, restart, checklive, backup, rollback, etc"
}

############################################################
# Entry, Do Not Modify
############################################################
lbf_init

# vim:ts=2:sw=2:et:ft=sh:
