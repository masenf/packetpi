#!/usr/bin/env bash

set -euxo pipefail

rm -rf /opt/direwolf/build && mkdir /opt/direwolf/build && cd /opt/direwolf/build
cmake ..
make -j4
make install
make install-conf
