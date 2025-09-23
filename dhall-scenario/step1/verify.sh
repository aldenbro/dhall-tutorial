#!/usr/bin/env bash
set -euo pipefail

FILE="correct_info.json"
GITHUB_URL="https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/${FILE}"
LOCAL_FILE="/root/info.json"
TMP_EXPECTED="$(mktemp)"

curl -L "$GITHUB_URL" -o "$TMP_EXPECTED"

if ! json-to-dhall --version >/dev/null 2>&1
then
    echo "json-to-dhall not found"
    exit 1
fi

if diff -q <(json-to-dhall --file "$LOCAL_FILE") <(json-to-dhall --file "$TMP_EXPECTED") >/dev/null; then
    rm -f "$TMP_EXPECTED"
    exit 0
else
    rm -f "$TMP_EXPECTED"
    exit 1
fi