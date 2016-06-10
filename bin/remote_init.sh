#!/bin/bash
set -eu

readonly REMOTE=$1
readonly USER_PASS=$2

ROOT="$(cd $(dirname $0); pwd)"

echo "$@"
echo "${USER_PASS}" | scp -r $ROOT "${REMOTE}:"
echo $USER_PASS | ssh $REMOTE << EOF
source ~/cook_book/init.sh
EOF
