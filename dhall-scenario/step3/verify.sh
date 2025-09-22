#!/usr/bin/env bash
set -euo pipefail

FILE="correct_info.json"
GITHUB_URL="https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/${FILE}"
TMP_EXPECTED="$(mktemp)"

curl -L "$GITHUB_URL" -o "$TMP_EXPECTED"

if diff -q <(dhall-to-json --file "/root/info.dhall") <(json-to-dhall --file "$TMP_EXPECTED" | dhall-to-json) >/dev/null; then
    rm -f "$TMP_EXPECTED"
    exit 0
else
    rm -f "$TMP_EXPECTED"
    exit 1
fi