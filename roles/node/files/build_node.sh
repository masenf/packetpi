#!/usr/bin/env bash

set -euxo pipefail

cd /opt/node/node-*
gzip -d ../node_*.diff.gz --stdout | patch -p1
./configure
make -j4
# specifically avoiding `installconf` since it overwrites ansible's config
make installbin installhelp installman
gzip -d ../node_*.diff.gz --stdout | patch -p1 -R
