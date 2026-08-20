# Keystone Clean-Machine Reproduction

## Purpose

This document records the clean-machine replay test for a preserved Keystone proof package.

The test verifies that the preserved Falco proof can be replayed successfully after a fresh checkout on independent GitHub-hosted operating-system runners.

## Preserved Proof

Proof package:

`release_evidence/falco_proof_13074749`

Source commit:

`13074749`

Final proof:

`sha256:8bee504181f99f34724af3dd0423e974174392273ba673ea809f28851ce15cd5`

## Fresh Environments

The preserved proof was replayed successfully on fresh GitHub-hosted runners for:

- Ubuntu
- Windows
- macOS

GitHub Actions run:

`32286821142`

All three operating-system jobs completed successfully.

## Replay Command

The cross-machine workflow checks out the Keystone engine and this public proof repository, then executes:

`go run ./cmd/keystone replay --run-id falco_proof_13074749 --run-root keystone-proof/release_evidence`

## Expected Result

The preserved proof replay must complete successfully.

For Actions run `32286821142`, the replay step succeeded on Ubuntu, Windows, and macOS.

## Byte Preservation

The public proof repository contains:

`.gitattributes`

with:

`release_evidence/** -text`

This prevents Git line-ending conversion from changing preserved evidence bytes across operating systems.

The rule was added after Windows correctly exposed that cross-platform checkout transformation could change hashed proof artifacts. After byte-preserving checkout was enforced, the preserved proof replay succeeded on all three operating systems.

## What This Demonstrates

This demonstrates that the preserved Falco proof package can be replayed from a fresh checkout across the tested compatible Ubuntu, Windows, and macOS environments.

It provides public evidence for the clean-machine reproduction claims mapped to I-02 and I-07 in `INVARIANT_CHECK_MAP.md`.

## Limitation

The Keystone execution engine remains private.

The proof package is public and inspectable, but independently rerunning the Keystone replay command currently requires access to the private Keystone engine.

Therefore this evidence demonstrates fresh-machine reproduction of the preserved public proof package in the recorded CI environments; it does not claim that an unaffiliated reviewer without engine access can independently execute the private replay implementation.
