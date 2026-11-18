#!/usr/bin/bash

# SPDX-FileCopyrightText: Copyright 2026 Exponent64
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

for script in /tmp/files/scripts/*.py; do
    python3 -I "${script}";
done
