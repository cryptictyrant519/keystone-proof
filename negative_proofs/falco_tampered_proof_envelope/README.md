# Falco Tampered Proof Envelope Negative Proof

## Target

Falco proof package.

## Original Proof Package

`release_evidence/falco_proof_13074749`

## Negative Test

A copied proof package was intentionally tampered by replacing the proof envelope `final_proof` with:

`sha256:0000000000000000000000000000000000000000000000000000000000000000`

## Verification Command

`go run ./cmd/keystone pipeline verify-proof --run-id falco_proof_13074749 --run-root /tmp/keystone_negative_falco`

## Observed Result

`BLOCKED`

## Observed State

`FAIL_CLOSED`

## Failure Reason

`final proof does not match verdict final chain hash`

## Failed Surface

`proof_envelope`

## Purpose

This negative proof demonstrates Keystone refusing to trust a tampered third-party proof package.

The target project is not being audited for defects.

The defect is intentionally introduced into the copied proof package to prove fail-closed verification behavior.
