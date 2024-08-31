#!/bin/sh
set -e

SRC=iproute2

git clone -b debian/bookworm-backports https://salsa.debian.org/kernel-team/iproute2.git "$SRC"
cd "$SRC"

git checkout 12f618a8aa559e03ffb9ef332d1be517fd79c1c0

sudo mk-build-deps --install --tool "apt-get --yes --no-install-recommends"
exec dpkg-buildpackage -b -us -uc -tc
