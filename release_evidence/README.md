# Keystone Release Evidence

## Release Proof Type

Keystone self-proof.

This package records Keystone running its own repository through the full configured pipeline and then independently verifying the generated proof envelope.

## Source Commit

`e02a09f`

## Project Verified

`/home/tyrant/Keystone`

## Run ID

`a77d6316edb93f99-000001`

## Proof Directory

`release_evidence/keystone_self_proof_e02a09f`

## Final Proof

`sha256:e2fc2ef66767172b09f13fef7c3dce5747bfd297cd0db622b891f9c2c175bedd`

## Observed Verification Results

Doctor:

`SAFE`

Pipeline run:

`SAFE`

Independent verify-proof:

`SAFE`

Verified stages:

`7`

## Verification Commands Used

Doctor:

`go run ./cmd/keystone doctor --repo /home/tyrant/Keystone --run-root /tmp/keystone_self_release_proof`

Run:

`go run ./cmd/keystone run --repo /home/tyrant/Keystone --run-root /tmp/keystone_self_release_proof`

Verify proof:

`go run ./cmd/keystone pipeline verify-proof --run-id a77d6316edb93f99-000001 --run-root /tmp/keystone_self_release_proof`

## Evidence Contents

The proof directory contains:

- `proof_envelope.json`
- stage manifests for all seven stages
- recorded stage inputs
- recorded stage outputs
- Keystone final verdict
- deterministic proof lineage material

## Status

This package is the current self-contained release proof evidence for commit `e02a09f`.

It exists so reviewers can inspect the proof material from disk instead of relying only on narrative audit text.
