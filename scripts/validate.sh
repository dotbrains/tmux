#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$repo_root"

tmux -f /dev/null start-server \; source-file tmux.conf \; kill-server
printf "OK tmux.conf\\n"
