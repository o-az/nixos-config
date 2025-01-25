#!/usr/bin/env bash

set -euo pipefail

brews=$(mac brew info --json --installed | jq 'map(.name)')

echo "$brews" > "machines/macos/brews_$(date +%s)".json

casks=$(mac brew info --cask --installed --json=v2 | jq '.casks | map(.token)')

echo "$casks" > "machines/macos/casks_$(date +%s)".json
