#!/usr/bin/env bash
set -euo pipefail

GITHUB_URL="https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/secret_assets/correct_info.json"
LOCAL_FILE="/root/info.json"
TMP_EXPECTED="$(mktemp)"

curl -fsSL "$GITHUB_URL" -o "$TMP_EXPECTED"

if diff -q <(json-to-dhall --file "$LOCAL_FILE") <(json-to-dhall --file "$TMP_EXPECTED") >/dev/null; then
    rm -f "$TMP_EXPECTED"
    exit 0
else
    rm -f "$TMP_EXPECTED"
    exit 1
fi