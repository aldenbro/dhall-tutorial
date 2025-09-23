#!/bin/bash
set -e

cd /root
wget https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/easter.sh
chmod +x /root/easter.sh

apt-get update -y

apt-get install -y bat
curl -L https://github.com/dhall-lang/dhall-haskell/releases/download/1.42.2/dhall-json-1.7.12-x86_64-linux.tar.bz2 | tar xj --strip-components=1 -C /usr/local/bin
apt-get install -y dhall
curl -L https://github.com/dhall-lang/dhall-haskell/releases/download/1.42.2/dhall-yaml-1.2.12-x86_64-linux.tar.bz2 | tar xj --strip-components=1 -C /usr/local/bin