#!/bin/bash
set -eu

echo "start init"

ROOT="$(cd $(dirname $0); pwd)"
function execute() {
  cd $ROOT
  source $1
}

execute lib.sh
sudo_keep_alive

execute install/git.sh
execute install/zsh.sh
execute install/rbenv.sh
execute install/tmux.sh
execute install/vim.sh

cp /etc/localtime /etc/localtime.org
ls -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 再起動してもhwclockがUTCにならないように
cp /etc/sysconfig/clock /etc/sysconfig/clock.org
sudo echo 'ZONE="Asia/Tokyo'

echo "finish init"
