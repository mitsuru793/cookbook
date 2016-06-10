#!/bin/bash
set -eu

LIBEVNET_VERSION=2.0.22
LIBEVNET_DIR="libevent-${LIBEVNET_VERSION}-stable"
LIBEVNET_TAR_FILE="${LIBEVNET_DIR}.tar.gz"

TMUX_VERSION=2.1
TMUX_DIR="tmux-${TMUX_VERSION}"
TMUX_TAR_FILE="${TMUX_DIR}.tar.gz"

# libevent (tmuxに必要)
cd /tmp
wget "https://github.com/libevent/libevent/releases/download/release-${LIBEVNET_VERSION}-stable/${LIBEVNET_TAR_FILE}"
tar zxvf $LIBEVNET_TAR_FILE
cd $LIBEVNET_DIR
./configure
make
sudo make install

# tmux
sudo yum -y install ncurses-devel
cd /tmp
wget "https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/${TMUX_TAR_FILE}"
tar zxvf $TMUX_TAR_FILE
cd $TMUX_DIR
./configure
make
sudo make install
sudo ln -s /usr/local/lib/libevent-2.0.so.5 /usr/lib64/libevent-2.0.so.5
