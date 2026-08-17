# Keystone

## ▶ Watch the 47-second video proof

[Open the embedded Keystone video proof](#video-proof)

Keystone is an execution evidence verification system.

It transforms execution into preserved evidence that can be independently verified.

Rather than asking reviewers to trust logs, dashboards, screenshots, or operator assertions, Keystone preserves deterministic evidence that can be replayed, examined, and verified independently.

Determinism, replay, recovery, canonical evidence, and fail-closed verification are the mechanisms that make independent trust possible.

> **The question Keystone answers is simple:**
>
> **Can this execution claim be verified from preserved evidence?**

---

## Video Proof

Watch Keystone execute a fresh seven-stage verification run, independently verify and replay the proof, reject a deliberately tampered copy `FAIL_CLOSED`, and verify the untouched evidence remains `SAFE`.

https://github.com/user-attachments/assets/78f0ec19-b19a-45d5-bc4c-32ebbe2715dc

# Start Here

Choose the review path that matches your goal.

## Quick Review — 5 Minutes

1. Read this README.
2. Inspect `release_evidence/README.md`.
3. Verify the Keystone self-proof.
4. Review `Keystone_Enterprise_Proof/README.txt`.

## Technical Review — 30 to 60 Minutes

1. `WHY_KEYSTONE.md`
2. `FOUNDATIONAL_PRINCIPLES.md`
3. `INVARIANTS.md`
4. `TRUTH.md`
5. `TECHNICAL_ARCHITECTURE.md`
6. `ARCHITECTURE.md`
7. `AUDIT_STANDARD.md`
8. `release_evidence/README.md`
9. `negative_proofs/`

## Independent Verification

See `release_evidence/README.md` for current proof packages and exact verification commands.

## Negative Proofs

The `negative_proofs/` directory demonstrates fail-closed behavior for intentionally invalid proof material:

- missing Keystone verdict;
- tampered proof envelope;
- tampered stage manifest.

## Enterprise Review Package

The `Keystone_Enterprise_Proof/` directory contains the enterprise-oriented review package, including demo material, technical brief, architecture image, proof artifacts, replay commands, and manifest hashes.

---

# The Problem

Modern software produces execution claims.

Very few systems preserve enough evidence for those claims to be independently verified.

Logs can be modified.

Screenshots can be misleading.

Dashboards summarize rather than prove.

Operational assertions require trust.

Keystone is designed to replace trust with independently verifiable evidence.

---

# What Keystone Does

Keystone is designed to:

- preserve canonical execution evidence;
- produce deterministic execution records;
- enable deterministic replay;
- support verification of preserved recovery evidence;
- preserve immutable historical evidence;
- fail closed when evidence cannot be verified;
- allow independent reviewers to determine whether an execution claim is trustworthy.

Trust is therefore the result of successful verification rather than an assumption.

---

# Public Repository Scope

This repository is Keystone's public engineering specification and proof surface.

It contains:

- foundational principles;
- architectural invariants;
- truth model;
- technical architecture specification;
- audit standard;
- public proof documentation;
- verification material;
- enterprise proof package;
- reproducibility evidence.

It does **not** contain:

- Keystone's private execution engine;
- proprietary implementation details;
- internal orchestration systems;
- production deployment infrastructure;
- proprietary recovery implementation;
- proprietary synchronization implementation.

The public repository exists so Keystone's architectural guarantees and verification model can be independently evaluated without exposing proprietary implementation.

---

# Complete Specification Reading Order

For the complete public specification, read in the following order:

1. `WHY_KEYSTONE.md`
2. `FOUNDATIONAL_PRINCIPLES.md`
3. `INVARIANTS.md`
4. `INVARIANT_CHECK_MAP.md`
5. `TRUTH.md`
6. `TECHNICAL_ARCHITECTURE.md`
7. `ARCHITECTURE.md`
8. `AUDIT_STANDARD.md`
9. `PROOF_PACKAGE.md`
10. `AUDIT_STATUS.md`
11. `ENTERPRISE_SUMMARY.md`
12. `THREAT_MODEL.md`
13. `WHAT_KEYSTONE_DOES_NOT_GUARANTEE.md`
14. `PUBLIC_PROOF_VERIFICATION.txt`

Each document builds upon the previous one.

---

# Enterprise Proof Package

The `Keystone_Enterprise_Proof/` directory contains the public enterprise review package used to demonstrate Keystone's verification model.

It includes proof artifacts, architecture material, replay demonstrations, verification artifacts, reproducibility evidence, and supporting documentation intended for independent technical review.

The public proof anchor for this package is `proof/proof-hash.txt`, which is the SHA256 hash of `proof/manifest.sha256`.

---

# Current Release Evidence

The `release_evidence/` directory contains the current public release proof package.

Each release evidence package includes:

- proof envelope;
- stage manifests;
- recorded stage inputs;
- recorded stage outputs;
- Keystone verdict;
- deterministic proof lineage.

See `release_evidence/README.md` for the current release package, proof hash, verification results, and reproduction commands.

---

# Verification Philosophy

Keystone does not attempt to make execution trustworthy.

Keystone preserves evidence so that trust can be produced through independent verification.

Evidence precedes trust.

Verification produces trust.

Trust is never assumed.
