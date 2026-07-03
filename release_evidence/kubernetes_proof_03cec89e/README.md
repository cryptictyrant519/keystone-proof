# Kubernetes External Proof Evidence

## Proof Type

External repository proof.

This package records Keystone running the Kubernetes repository through the full configured pipeline and then independently verifying the copied proof package from disk.

## Source Repository

`/home/tyrant/kubernetes`

## Source Commit

`03cec89e`

## Run ID

`802146fac3b93d2b-000001`

## Proof Directory

`release_evidence/kubernetes_proof_03cec89e`

## Final Proof

`sha256:b9206b576d996171653333b500a42507812fd49e1eeea836b69f429a1c0f9ea0`

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

`go run ./cmd/keystone doctor --repo /home/tyrant/kubernetes --run-root /tmp/keystone_kubernetes_proof`

Run:

`go run ./cmd/keystone run --repo /home/tyrant/kubernetes --run-root /tmp/keystone_kubernetes_proof`

Verify proof:

`go run ./cmd/keystone pipeline verify-proof --run-id 802146fac3b93d2b-000001 --run-root /tmp/keystone_kubernetes_proof`

Verify copied package:

`go run ./cmd/keystone pipeline verify-proof --run-id kubernetes_proof_03cec89e --run-root /home/tyrant/keystone-proof/release_evidence`

## Evidence Contents

The proof directory contains:

- `proof_envelope.json`
- stage manifests for all seven stages
- recorded stage inputs
- recorded stage outputs
- Keystone final verdict
- deterministic proof lineage material

## Status

This package is externally verifiable proof evidence for Kubernetes commit `03cec89e`.
