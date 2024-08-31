#!/bin/sh
set -e

SRC=iproute2

git clone -b buster-backports https://salsa.debian.org/kernel-team/iproute2.git "$SRC"
cd "$SRC"

git checkout f0c31ddcc9cbd3eba6b10373dcfbec9fedcadd04

sudo mk-build-deps --install --tool "apt-get --yes --no-install-recommends"
exec dpkg-buildpackage -b -us -uc -tc
