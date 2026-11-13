#!/usr/bin/bash

set -euo pipefail

for script in /tmp/files/scripts/*.py; do
    python3 -I "${script}";
done
