# Keystone Reviewer Path

Use the path that matches the depth of review you want.

## 5-Minute Proof

1. Read the opening sections of `README.md`.
2. Watch the 47-second video proof linked there.
3. Run:

`bash verify/verify-manifest.sh`

Expected final output:

`PASS: manifest and proof hash verified`

4. Inspect `release_evidence/falco_proof_13074749/README.md`.
5. Inspect `negative_proofs/` and `MUTATION_MATRIX.md`.

This path shows the positive proof, preserved fail-closed evidence, mutation coverage, and public integrity check.

## 30-Minute Technical Review

Read in this order:

1. `WHY_KEYSTONE.md`
2. `FOUNDATIONAL_PRINCIPLES.md`
3. `INVARIANTS.md`
4. `INVARIANT_CHECK_MAP.md`
5. `TRUTH.md`
6. `TECHNICAL_ARCHITECTURE.md`
7. `THREAT_MODEL.md`
8. `WHAT_KEYSTONE_DOES_NOT_GUARANTEE.md`
9. `MUTATION_MATRIX.md`
10. `CLEAN_MACHINE_REPRODUCTION.md`
11. `release_evidence/README.md`
12. `PUBLIC_PROOF_VERIFICATION.txt`

## Exact Public Verification Command

From the repository root:

`bash verify/verify-manifest.sh`

Expected result:

`PASS: manifest and proof hash verified`

This verifies the published enterprise-package artifact hashes and the proof hash anchor.

## Preserved Replay Evidence

The preserved Falco proof is:

`release_evidence/falco_proof_13074749`

Fresh-machine replay succeeded on GitHub-hosted Ubuntu, Windows, and macOS runners in Actions run `32286821142`.

The replay command used by the private cross-machine workflow was:

`go run ./cmd/keystone replay --run-id falco_proof_13074749 --run-root keystone-proof/release_evidence`

Expected result for the preserved compatible proof:

`SAFE`

Verified stages:

`7`

## Negative Evidence

Preserved fail-closed examples are under `negative_proofs/`.

They include:

- missing Keystone verdict;
- tampered stage manifest;
- tampered proof envelope.

The broader mutation coverage and observed result codes are documented in `MUTATION_MATRIX.md`.

## Limitations

The Keystone execution engine and verifier implementation are private and are not included in this repository.

The public manifest verifier can independently verify the published package hashes and proof anchor.

The public proof packages can be inspected directly, but independently executing Keystone `replay` or `verify-proof` currently requires access to the private Keystone engine.

A `SAFE` result establishes consistency of the supplied evidence under the active verifier contract. It does not establish security, correctness, compliance, authorization, deployment approval, or facts outside the declared evidence boundary.

For the complete limitation set, read `WHAT_KEYSTONE_DOES_NOT_GUARANTEE.md`.
