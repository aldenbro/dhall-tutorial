#!/bin/bash
set -e

# Update package list
apt-get update -y

# Install dhall and dhall-json
apt-get install -y dhall dhall-json