# Keystone External Proof Demonstrations

## Sigstore Proof

Project:

`https://github.com/sigstore/sigstore`

Local target:

`/home/tyrant/sigstore`

Proof package:

`external_proofs/sigstore_proof_cfd781df3fd03186`

Run ID:

`cfd781df3fd03186-000001`

Final proof:

`sha256:8540cf5dadacf8123b0848a6071693f04e8feb01048cca8a4928f4b68997f422`

Observed results:

- Doctor: SAFE
- Pipeline run: SAFE
- Independent verify-proof: SAFE
- Verified stages: 7

Verification command for packaged proof:

`go run ./cmd/keystone pipeline verify-proof --run-id sigstore_proof_cfd781df3fd03186 --run-root external_proofs`

## Purpose

This directory contains external open-source repository proof demonstrations.

Each proof package records Keystone running a real public repository through the configured pipeline and then independently verifying the generated proof envelope.

These packages exist to demonstrate independently verifiable execution evidence for real-world repositories. They are not security audits of the target projects and make no claim that the target repositories contain defects.
