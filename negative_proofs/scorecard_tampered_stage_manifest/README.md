# Scorecard Tampered Stage Manifest Negative Proof

## Target

OpenSSF Scorecard proof package.

## Original Proof Package

`external_proofs/scorecard_proof_9ad561d838321315`

## Negative Test

A copied proof package was intentionally modified by changing one referenced stage manifest:

`01_teradox/stage_manifest.json`

The file reference `teradox_profile.json` was changed to:

`teradox_profile_tampered.json`

## Verification Command

`go run ./cmd/keystone pipeline verify-proof --run-id scorecard_proof_9ad561d838321315 --run-root /tmp/keystone_tampered_stage_manifest`

## Observed Result

`BLOCKED`

## Observed State

`FAIL_CLOSED`

## Failure Reason

`proof artifact hash mismatch: 01_teradox/stage_manifest.json`

## Failed Surface

`stage_manifest_ref`

## Failed Path

`01_teradox/stage_manifest.json`

## Purpose

This negative proof demonstrates Keystone refusing to trust a third-party proof package after a referenced stage manifest is modified.

The target project is not being audited for defects.

The defect is intentionally introduced into a copied proof package to prove fail-closed verification behavior.
