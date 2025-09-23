#!/usr/bin/env bash
set -euo pipefail

TMP_EXPECTED="$(mktemp)"
curl -L "https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/correct_info.csv" -o "$TMP_EXPECTED"

if diff -wq <(dhall text --file csv.dhall) "$TMP_EXPECTED" >/dev/null; then
    rm -f "$TMP_EXPECTED"
    exit 0
else
    rm -f "$TMP_EXPECTED"
    exit 1
fi