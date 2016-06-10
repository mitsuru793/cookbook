#!/bin/bash
set -eu

sudo yum -y install curl-devel expat-devel gettext-devel \
  openssl-devel zlib-devel \
  perl-ExtUtils-MakeMaker gcc wget

GIT_VERSION=2.7.0
GIT_DIR="git-${GIT_VERSION}"
GIT_TAR_FILE="${GIT_DIR}.tar.gz"

cd /tmp
wget "https://www.kernel.org/pub/software/scm/git/${GIT_TAR_FILE}"
tar zxvf $GIT_TAR_FILE
cd $GIT_DIR
make prefix=/usr/local all
sudo make prefix=/usr/local install
