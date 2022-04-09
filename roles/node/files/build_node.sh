#!/usr/bin/env bash

set -euxo pipefail

cd /opt/node/node-*
gzip -d ../node_*.diff.gz --stdout | patch -p1
./configure
make -j4
make install
gzip -d ../node_*.diff.gz --stdout | patch -p1 -R
