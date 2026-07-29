#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$repo_root"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

grep -v "plugins/tpm/tpm" tmux.conf > "$tmp_dir/tmux.conf"

tmux -f /dev/null start-server \; source-file "$tmp_dir/tmux.conf" \; \
    kill-server
printf "OK tmux.conf\\n"
