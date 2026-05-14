#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "Keystone proof package verification"
echo

echo "Checking manifest hashes..."
sha256sum -c proof/manifest.sha256

echo
echo "Checking proof hash anchor..."
EXPECTED="$(cat proof/proof-hash.txt)"
ACTUAL="$(sha256sum proof/manifest.sha256 | awk '{print $1}')"

echo "expected: $EXPECTED"
echo "actual:   $ACTUAL"

if [ "$EXPECTED" != "$ACTUAL" ]; then
  echo "FAIL: proof hash mismatch"
  exit 1
fi

echo
echo "PASS: manifest and proof hash verified"
