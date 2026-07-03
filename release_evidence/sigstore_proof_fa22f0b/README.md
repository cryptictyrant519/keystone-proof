# Sigstore External Proof Evidence

## Proof Type

External repository proof.

This package records Keystone running the Sigstore repository through the full configured pipeline and then independently verifying the copied proof package from disk.

## Source Repository

`/home/tyrant/sigstore`

## Source Commit

`fa22f0b`

## Run ID

`cfd781df3fd03186-000002`

## Proof Directory

`release_evidence/sigstore_proof_fa22f0b`

## Final Proof

`sha256:8540cf5dadacf8123b0848a6071693f04e8feb01048cca8a4928f4b68997f422`

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

`go run ./cmd/keystone doctor --repo /home/tyrant/sigstore --run-root /tmp/keystone_sigstore_proof`

Run:

`go run ./cmd/keystone run --repo /home/tyrant/sigstore --run-root /tmp/keystone_sigstore_proof`

Verify proof:

`go run ./cmd/keystone pipeline verify-proof --run-id cfd781df3fd03186-000002 --run-root /tmp/keystone_sigstore_proof`

Verify copied package:

`go run ./cmd/keystone pipeline verify-proof --run-id sigstore_proof_fa22f0b --run-root /home/tyrant/keystone-proof/release_evidence`

## Evidence Contents

The proof directory contains:

- `proof_envelope.json`
- stage manifests for all seven stages
- recorded stage inputs
- recorded stage outputs
- Keystone final verdict
- deterministic proof lineage material

## Status

This package is externally verifiable proof evidence for Sigstore commit `fa22f0b`.
