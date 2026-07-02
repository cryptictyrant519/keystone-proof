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


## OpenSSF Scorecard Proof

Project:

`https://github.com/ossf/scorecard`

Local target:

`/home/tyrant/scorecard`

Proof package:

`external_proofs/scorecard_proof_9ad561d838321315`

Run ID:

`9ad561d838321315-000001`

Final proof:

`sha256:184e491c66bcffebf92890d3d906001f85dfe5095d539475fbe6169b08e4ca4c`

Observed results:

- Doctor: SAFE
- Pipeline run: SAFE
- Independent verify-proof: SAFE
- Verified stages: 7

Verification command for packaged proof:

`go run ./cmd/keystone pipeline verify-proof --run-id scorecard_proof_9ad561d838321315 --run-root /home/tyrant/keystone-proof/external_proofs`


## Purpose

This directory contains external open-source repository proof demonstrations.

Each proof package records Keystone running a real public repository through the configured pipeline and then independently verifying the generated proof envelope.

These packages exist to demonstrate independently verifiable execution evidence for real-world repositories. They are not security audits of the target projects and make no claim that the target repositories contain defects.
