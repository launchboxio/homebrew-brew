#!/usr/bin/env bash

VERSION="$1"
URL="https://github.com/launchboxio/launchbox/archive/refs/tags/${VERSION}.tar.gz"

wget "${URL}"
SHA256=$(sha256sum "${VERSION}.tar.gz")
rm "${VERSION}.tar.gz"
echo "Hash of ${URL}: "${SHA256}

# TODO: Update Formula/launchbox.rb with the file outputs