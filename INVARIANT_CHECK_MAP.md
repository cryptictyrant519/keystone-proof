# Keystone Invariant-to-Check Map

## Purpose

This document maps Keystone's public invariants to the proof artifacts, verifier-contract checks, failure behavior, and public evidence that support them.

It describes what the verifier establishes at the public contract boundary. It does not disclose private implementation functions, internal algorithms, or bypass-sensitive details.

A listed check is not a claim that the underlying tools, environment, or target repository are trustworthy. The limits in `THREAT_MODEL.md` and `WHAT_KEYSTONE_DOES_NOT_GUARANTEE.md` remain authoritative.

## Coverage Status

- **Demonstrated** — exercised by preserved positive or negative public evidence.
- **Partially demonstrated** — some enforcement is shown, but dedicated mutation coverage remains incomplete.
- **Contract-defined** — represented in the public artifact contract, but not yet exercised by a dedicated public negative test.
- **Not demonstrated publicly** — no current public proof establishes the invariant independently.

## Invariant Map

| ID | Invariant | Public artifact or field | Verifier-contract check | Failure behavior | Current public evidence | Coverage |
|---|---|---|---|---|---|---|
| I-01 | Artifact Truth Over Execution Claims | `proof_envelope.json`; referenced stage manifests; declared input/output artifacts; `07_keystone/keystone_verdict.json` | Trust is established from referenced evidence and recorded hashes, not logs, screenshots, operator identity, or command-success claims. | Missing, altered, or unverifiable evidence prevents the trust claim. | Falco, Kubernetes, Sigstore, and Scorecard copied-package verification; all preserved negative proofs. | Demonstrated |
| I-02 | Deterministic Replay | Complete recorded run; stage-manifest `inputs`, `outputs`, `chain_hash`, and `previous_chain_hash` | Replay verifies the recorded artifacts and stage chain against the preserved run. Divergence prevents successful replay. | Replay must not return `SAFE` when recorded evidence diverges. | Falco replay returned `SAFE` with seven verified stages. | Partially demonstrated — fresh-machine reproduction remains pending |
| I-03 | Canonical Artifact Integrity | `canonicalization_version`; `hash_version`; stage-manifest `inputs` and `outputs`; `stage_manifest_refs[*].sha256` | Declared artifacts and manifests must exist and match their recorded content hashes under the declared canonicalization and hash versions. | Hash mismatch, missing artifact, malformed artifact, or unsupported representation blocks verification. | `scorecard_tampered_stage_manifest` is rejected with `proof artifact hash mismatch`; failed surface `stage_manifest_ref`. | Demonstrated |
| I-04 | Chain Continuity | `genesis_chain_hash`; stage-manifest `previous_chain_hash` and `chain_hash`; `stage_order`; verdict `final_chain_hash`; envelope `final_proof` | Every stage must connect to the preceding stage in the declared order, and the final proof must agree with the verdict's final chain hash. | A broken, missing, reordered, duplicated, substituted, or mismatched link blocks verification. | Observed mutations: cross-run stage-manifest substitution -> `stage_chain_link_mismatch`; reordered stages -> `stage_order_mismatch`; duplicate manifest reference -> `proof_stage_manifest_ref_duplicate`; missing referenced stage artifact -> `proof_artifact_missing`. Untouched Falco and Scorecard proofs reverified `SAFE`. | Demonstrated |
| I-05 | Fail-Closed Verification | All required proof artifacts and contract fields | Missing, altered, malformed, incompatible, conflicting, or unverifiable evidence must never silently become successful verification. | Expected outcomes include `BLOCKED`, `FAIL`, `INCOMPLETE`, incompatible verification, and `FAIL_CLOSED`. | Missing verdict: `FAIL_CLOSED`; tampered stage manifest: `BLOCKED` and `FAIL_CLOSED`; tampered proof envelopes: `BLOCKED` and `FAIL_CLOSED`. | Demonstrated |
| I-06 | Explicit Evidence Boundaries | Stage-manifest `inputs` and `outputs`; envelope `stage_manifest_refs`; `verdict_ref` | Verification evaluates only declared evidence references and does not convert undeclared environment state into verified fact. | Evidence outside the declared boundary remains unverified; missing or changed declared evidence blocks the claim. | Observed replay mutations: changed declared input -> `artifact_hash_mismatch`; changed declared output -> `artifact_hash_mismatch`; missing referenced evidence -> `proof_artifact_missing`. Untouched Falco and Scorecard proofs reverified `SAFE`. | Partially demonstrated — undeclared-input mutation remains pending |
| I-07 | Replay-Verifiable Proof | Complete proof package; `run_id`; stage evidence; proof and verifier contract versions | The supplied evidence must support independent `verify-proof` validation and replay under compatible conditions. | A package that cannot be verified or replayed under its declared contract is not trusted. | Original Falco run: `SAFE` verify-proof and `SAFE` replay; copied Falco package: `SAFE` verify-proof. | Partially demonstrated — clean-machine reproduction remains pending |
| I-08 | No Trust From Authority Alone | Proof package as a whole | Successful execution, trusted operator status, logs, or authority do not bypass artifact, lineage, verdict, and final-proof checks. | Unsupported claims receive no verified status. | Positive proofs require artifact verification; intentionally corrupted copies fail despite originating from valid proofs. | Demonstrated collectively; no standalone authority mutation applies |
| I-09 | Schema-Governed Records | `schema_version`; `proof_contract_version`; `verifier_contract_version`; `canonicalization_version`; `hash_version` | Records must declare compatible schemas and contracts and contain the required fields and valid values for those versions. | Missing, malformed, unknown, or incompatible contract material must not verify successfully. | Observed version mutations reject with `proof_envelope_schema_version_invalid`, `proof_contract_version_invalid`, `verifier_contract_version_invalid`, `canonicalization_version_invalid`, and `hash_version_invalid`. Untouched Falco and Scorecard proofs reverified `SAFE`. | Demonstrated |
| I-10 | Quarantine Before Trust | Verification result and failed-surface information; private quarantine lifecycle where applicable | Ambiguous, partial, mixed, corrupted, or conflicting evidence must be isolated or rejected before any trust claim is established. | Verification fails closed instead of accepting uncertain evidence. | Public negative proofs demonstrate rejection and failed-surface reporting. The private quarantine lifecycle is outside the current public proof package. | Partially demonstrated — quarantine handling itself is not demonstrated publicly |

## Preserved Negative Evidence

| Mutation | Preserved evidence | Expected result | Observed failure |
|---|---|---|---|
| Remove final Keystone verdict | `negative_proofs/scorecard_missing_keystone_verdict` | Reject incomplete evidence | `FAIL`; `FAIL_CLOSED`; `violation:run_verdict_missing` |
| Modify a referenced stage manifest | `negative_proofs/scorecard_tampered_stage_manifest` | Reject altered stage evidence | `BLOCKED`; `FAIL_CLOSED`; failed surface `stage_manifest_ref` |
| Replace Scorecard final proof | `negative_proofs/scorecard_tampered_proof_envelope` | Reject final-chain mismatch | `BLOCKED`; `FAIL_CLOSED`; failed surface `proof_envelope` |
| Replace Falco final proof | `negative_proofs/falco_tampered_proof_envelope` | Reject final-chain mismatch while the untouched proof remains valid | `BLOCKED`; `FAIL_CLOSED`; untouched Falco package remains `SAFE` |

## Mutation Coverage Still Required

The next public negative-test matrix should cover:

1. Remove each required artifact class not already covered by preserved missing-artifact tests.
2. Add an undeclared-input mutation for the explicit evidence-boundary case.
3. Replay under an incompatible environment.
4. Extend untouched-reference `SAFE` confirmation to each future disposable mutation.

## Interpretation Boundary

This map establishes the relationship between Keystone's declared invariants and its public proof-verification contract.

It does not establish:

- completeness of evidence omitted before capture;
- trustworthiness of Keystone's dependencies or underlying tools;
- security or correctness of the target repository;
- authorization or deployment approval;
- resistance to compromise of the private verifier or hashing implementation;
- cross-machine reproducibility until that test is separately preserved.
