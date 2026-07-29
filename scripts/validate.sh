#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$repo_root"

tmp_home="$(mktemp -d)"
trap 'rm -rf "$tmp_home"' EXIT

mkdir -p "$tmp_home/.tmux/plugins"
ln -s "$repo_root/plugins/tpm" "$tmp_home/.tmux/plugins/tpm"

HOME="$tmp_home" tmux -f /dev/null start-server \; source-file tmux.conf \; \
    kill-server
printf "OK tmux.conf\\n"
