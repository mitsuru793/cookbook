#!/bin/bash
set -eu

need_commands git zsh

RUBY_VERSION="2.2.2"
SHELL_ENV_FILE="$HOME/.zshenv"
sudo yum -y install sqlite-devel readline-devel

# 複数のrubyをインストールして管理することができるrbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $SHELL_ENV_FILE
echo 'eval "$(rbenv init -)"' >> $SHELL_ENV_FILE
source $SHELL_ENV_FILE

# rbenv installを実行するために必要な、rbenvのプラグインであるruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# rubyをインストール
rbenv install $RUBY_VERSION
rbenv global 2.2.2
