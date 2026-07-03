# OpenSSF Scorecard External Proof Evidence

## Proof Type

External repository proof.

This package records Keystone running the OpenSSF Scorecard repository through the full configured pipeline and then independently verifying the copied proof package from disk.

## Source Repository

`/home/tyrant/scorecard`

## Source Commit

`916bfc57`

## Run ID

`9ad561d838321315-000002`

## Proof Directory

`release_evidence/scorecard_proof_916bfc57`

## Final Proof

`sha256:184e491c66bcffebf92890d3d906001f85dfe5095d539475fbe6169b08e4ca4c`

## Observed Verification Results

Doctor:

`SAFE`

Pipeline run:

`SAFE`

Independent verify-proof:

`SAFE`

Copied package verify-proof:

`SAFE`

Verified stages:

`7`

## Verification Commands Used

Doctor:

`go run ./cmd/keystone doctor --repo /home/tyrant/scorecard --run-root /tmp/keystone_scorecard_proof`

Run:

`go run ./cmd/keystone run --repo /home/tyrant/scorecard --run-root /tmp/keystone_scorecard_proof`

Verify proof:

`go run ./cmd/keystone pipeline verify-proof --run-id 9ad561d838321315-000002 --run-root /tmp/keystone_scorecard_proof`

Verify copied package:

`go run ./cmd/keystone pipeline verify-proof --run-id scorecard_proof_916bfc57 --run-root /home/tyrant/keystone-proof/release_evidence`

## Evidence Contents

The proof directory contains:

- `proof_envelope.json`
- stage manifests for all seven stages
- recorded stage inputs
- recorded stage outputs
- Keystone final verdict
- deterministic proof lineage material

## Status

This package is externally verifiable proof evidence for OpenSSF Scorecard commit `916bfc57`.
