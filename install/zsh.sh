#!/bin/bash
set -eu

# zshをインストールするにはncurses-develとgccが必要です。
sudo yum -y install ncurses-devel gcc wget expect

USER_PASS="vagrant"
ZSH_VERSION=5.2
ZSH_DIR="zsh-${ZSH_VERSION}"
ZSH_TAR_FILE="${ZSH_DIR}.tar.gz"

cd /tmp
wget "http://sourceforge.net/projects/zsh/files/zsh/${ZSH_VERSION}/${ZSH_TAR_FILE}"
tar zxvf $ZSH_TAR_FILE
cd $ZSH_DIR
./configure --with-tcsetpgrp
make
sudo make install

# 現在のユーザーのログインシェルを変更します。
echo `which zsh` | sudo tee -a /etc/shells
echo "${USER_PASS}" | chsh -s `which zsh`
