#!/usr/bin/env bash
set -euo pipefail

HOOK_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Move to the project root directory
cd "${HOOK_DIR}/.."

if command -v docker >/dev/null 2>&1; then
    exec ./docker/run-docker.sh ruff check "$@"
else
    exec ruff check "$@"
fi
