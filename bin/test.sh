#!/usr/bin/env bash

if hash readlink 2>/dev/null && [[ "$(uname -s)" != "Darwin" ]]; then
    PROJECT_DIR="$(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")")"
else
    PROJECT_DIR="$(dirname "$(dirname "${BASH_SOURCE[0]}")")"
fi

cd "$PROJECT_DIR" || exit 2

output_path=$(mktemp)

sass --no-source-map tests/test.scss "$output_path"

if cmp -s "tests/expected.css" "$output_path"; then
    rm "$output_path"

    echo "[OK]"
    exit 0
else
    rm "$output_path"

    echo "[FAILED]"
    if [ -f "$output_path" ]; then
        git diff --no-index -- "tests/expected.css" "$output_path"
    fi
    exit 1
fi
