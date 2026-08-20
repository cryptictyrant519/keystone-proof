# Falco External Proof Evidence

## Proof Type

External repository proof.

This package records Keystone running the Falco repository through the full configured pipeline and then independently verifying the copied proof package from disk.

## Source Repository

`/home/swaa1/falco`

## Source Commit

`13074749`

## Run ID

`63372de631f6de56-000001`

## Proof Directory

`release_evidence/falco_proof_13074749`

## Final Proof

`sha256:8bee504181f99f34724af3dd0423e974174392273ba673ea809f28851ce15cd5`

## Observed Verification Results

Doctor:

`SAFE`

Pipeline run:

`SAFE`

Independent verify-proof:

`SAFE`

Replay:

`SAFE`

Fresh-machine preserved-package replay:

`SAFE` on GitHub-hosted Ubuntu, Windows, and macOS runners in Actions run `32286821142`.

Copied package verify-proof:

`SAFE`

Verified stages:

`7`

## Verification Commands Used

Doctor:

`go run ./cmd/keystone doctor --repo /home/swaa1/falco --run-root /tmp/keystone_falco_proof`

Run:

`go run ./cmd/keystone run --repo /home/swaa1/falco --run-root /tmp/keystone_falco_proof`

Verify proof:

`go run ./cmd/keystone pipeline verify-proof --run-id 63372de631f6de56-000001 --run-root /tmp/keystone_falco_proof`

Replay:

`go run ./cmd/keystone replay --run-id 63372de631f6de56-000001 --run-root /tmp/keystone_falco_proof`

Verify copied package:

`go run ./cmd/keystone pipeline verify-proof --run-id falco_proof_13074749 --run-root /home/swaa1/keystone-proof/release_evidence`

## Evidence Contents

The proof directory contains:

- `proof_envelope.json`
- stage manifests for all seven stages
- recorded stage inputs
- recorded stage outputs
- Keystone final verdict
- deterministic proof lineage material

## Status

This package is externally verifiable proof evidence for Falco commit `13074749`.
