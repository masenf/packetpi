#!/usr/bin/env bash

set -euxo pipefail

cd /opt/node/node-*
./configure <<< "y\ny\ny\n"
make -j4
make install
