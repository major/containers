#!/bin/bash
set -euxo pipefail

dnf -y upgrade
dnf -y install gcc make

curl -OL http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar xf ta-lib-0.4.0-src.tar.gz
pushd ta-lib
  ./configure
  make -j1
  make install
popd
rm -rf ta-lib-0.4.0-src.tar.gz ta-lib

dnf history -y rollback 1
dnf -y install python38 python38-devel python38-pip python38-wheel
pip3 install matplotlib pandas ta-lib yfinance
dnf clean all
