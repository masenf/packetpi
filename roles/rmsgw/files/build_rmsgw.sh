#!/usr/bin/env bash

set -euxo pipefail

cd /opt/rmsgw
./autogen.sh
./configure
make -j4
make install
