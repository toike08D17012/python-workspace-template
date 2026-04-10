#!/usr/bin/env bash
set -euo pipefail

HOOK_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Move to the project root directory
cd "${HOOK_DIR}/.."

set +e
if command -v docker >/dev/null 2>&1; then
    ../docker/run-docker.sh pytest
    return_code=$?
else
    pytest
    return_code=$?
fi
set -e

if [ "${return_code}" -eq 5 ]; then
    echo "No tests collected. Treating pytest exit code 5 as success."
    exit 0
fi

exit "${return_code}"
