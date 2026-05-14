# Keystone Verification Flow

This directory contains the minimal public verification flow for the Keystone proof package.

## What This Verifies

The script verifies:

- all proof-package artifact hashes listed in `proof/manifest.sha256`
- the proof hash anchor in `proof/proof-hash.txt`
- whether the current repository artifacts match the published proof package state

## Run

./verify/verify-manifest.sh

## Expected Result

A successful verification ends with:

PASS: manifest and proof hash verified

## Scope

This public verification flow validates the published proof artifacts.

It does not expose or execute Keystone's private implementation, orchestration internals, or proprietary deterministic pipeline engine.	
