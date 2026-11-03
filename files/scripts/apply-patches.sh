#!/usr/bin/env bash
set -euo pipefail

PATCH_ARGS=("--forward" "--strip=1" "--no-backup-if-mismatch" "--verbose")

for patch_file in /root/patches/*.patch; do
    patch -d / "${PATCH_ARGS[@]}" < "${patch_file}";
done

rm -rfv /root/patches
