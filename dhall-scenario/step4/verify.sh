#!/usr/bin/env bash
set -euo pipefail

FILE_YAML="correct_info.yaml"
FILE_CSV="correct_info.csv"
LOCAL_YAML="/root/info.yaml"
LOCAL_CSV="/root/info.csv"

TMP_EXPECTED="$(mktemp)"
curl -L "https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/${FILE_YAML}" -o "$TMP_EXPECTED"

if diff -wq "$LOCAL_YAML" "$TMP_EXPECTED" > /dev/null; then
    rm -f "$TMP_EXPECTED"
else
    rm -f "$TMP_EXPECTED"
    exit 1
fi

TMP_EXPECTED="$(mktemp)"
curl -L "https://raw.githubusercontent.com/aldenbro/dhall-tutorial/refs/heads/main/dhall-scenario/assets/${FILE_CSV}" -o "$TMP_EXPECTED"

if diff -wq "$LOCAL_CSV" "$TMP_EXPECTED" >/dev/null; then
    rm -f "$TMP_EXPECTED"
    exit 0
else
    rm -f "$TMP_EXPECTED"
    exit 1
fi