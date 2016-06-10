#!/bin/bash
set -eu

function error_exit () {
  echo "$1" #1>&2
  echo "exit this script"
  exit 1
}

# このスクリプトが終了するまで、
# 1分ごとにsodoを実行してtimeoutを防ぎます。
function sudo_keep_alive () {
  sudo -v

  while true
  do
    sudo -n true
    sleep 60;
    kill -0 "$$" || exit
  done 2>/dev/null &
}

# コマンドの存在を確認します。
function has_commands? () {
  local all_exsit=0
  while [ $# -gt 0 ]
  do
    local cmd=$1
    # set -eの時、コマンドが見つからずエラーで終了しないように、&& :をつける
    type $cmd >/dev/null 2>&1 && :
    if [ $? = 1 ]; then
      echo "${cmd} doesn't exsit."
      all_exsit=1
    fi
    shift
  done
  return $all_exsit
}

# 必要なコマンドがない場合は、スクリプトを終了します。
function need_commands () {
  has_commands? "$@" && :
  [ $? = 1 ] && error_exit "Required commands doesn't exit."
  return 0
}
