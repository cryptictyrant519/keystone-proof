# Scorecard Missing Keystone Verdict Negative Proof

## Target

OpenSSF Scorecard proof package.

## Original Proof Package

`external_proofs/scorecard_proof_9ad561d838321315`

## Negative Test

A copied proof package was intentionally modified by deleting:

`07_keystone/keystone_verdict.json`

## Verification Command

`go run ./cmd/keystone pipeline verify-proof --run-id scorecard_proof_9ad561d838321315 --run-root /tmp/keystone_missing_artifact`

## Observed Result

`FAIL`

## Observed State

`FAIL_CLOSED`

## Failure Reason

`violation:run_verdict_missing`

## Purpose

This negative proof demonstrates Keystone refusing to verify a third-party proof package when the final Keystone verdict artifact is missing.

The target project is not being audited for defects.

The defect is intentionally introduced into a copied proof package to prove fail-closed verification behavior.
