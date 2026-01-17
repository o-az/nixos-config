#!/usr/bin/env bash

set -eou pipefail

if command -v bun &>/dev/null; then
  npm() {
    if [[ "$*" == *"--real"* ]] || [[ -n "$USE_REAL_NPM" ]]; then
      export USE_REAL_NPM=1
      trap 'unset USE_REAL_NPM' EXIT
      command npm "$(echo "${@/--real/}" | xargs)"
    else
      bun "$@"
    fi
  }
  npx() {
    if [[ "$*" == *"--real"* ]] || [[ -n "$USE_REAL_NPX" ]]; then
      export USE_REAL_NPX=1
      trap 'unset USE_REAL_NPX' EXIT
      command npx "$(echo "${@/--real/}" | xargs)"
    else
      bunx "$@"
    fi
  }
  pnpm() {
    if [[ "$*" == *"--real"* ]] || [[ -n "$USE_REAL_PNPM" ]]; then
      export USE_REAL_PNPM=1
      trap 'unset USE_REAL_PNPM' EXIT
      # first check if the 2nd argument is `dlx`, if yes then go to `pnpx()`, otherwise go to `pnpm()`
      if [[ "$2" == "dlx" ]]; then
        command pnpx "$(echo "${@/--real/}" | xargs)"
      else
        command pnpm "$(echo "${@/--real/}" | xargs)"
      fi
    else
      bun "$@"
    fi
  }
  pnpx() {
    if [[ "$*" == *"--real"* ]] || [[ -n "$USE_REAL_PNPM" ]]; then
      export USE_REAL_PNPM=1
      trap 'unset USE_REAL_PNPM' EXIT
      command pnpx "$(echo "${@/--real/}" | xargs)"
    else
      bunx "$@"
    fi
  }
  yarn() {
    if [[ "$*" == *"--real"* ]] || [[ -n "$USE_REAL_YARN" ]]; then
      export USE_REAL_YARN=1
      trap 'unset USE_REAL_YARN' EXIT
      command yarn "$(echo "${@/--real/}" | xargs)"
    else
      bun "$@"
    fi
  }
else
  npm() {
    command npm "$@"
  }
  npx() {
    command npx "$@"
  }
  pnpm() {
    command pnpm "$@"
  }
  pnpx() {
    command pnpx "$@"
  }
  yarn() {
    command yarn "$@"
  }
fi
