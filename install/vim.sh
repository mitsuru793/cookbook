#!/bin/bash
set -eu

need_commands git

sudo yum -y install ncurses-devel lua lua-devel

cd /tmp
git clone https://github.com/vim/vim.git
cd vim/src/
./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-luainterp=dynamic \
  --enable-fontset
make
sudo make install

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
