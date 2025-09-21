#!/bin/bash
set -e

# Update package list
apt-get update -y

# Install dhall
apt-get install -y dhall

# Install dhall tools
curl -L https://github.com/dhall-lang/dhall-haskell/releases/download/1.42.2/dhall-json-1.7.12-x86_64-linux.tar.bz2 | tar xj --strip-components=1 -C /usr/local/bin

# Give user the file
mkdir -p /root/scenario
cp /root/assets/info.json /root/scenario/
