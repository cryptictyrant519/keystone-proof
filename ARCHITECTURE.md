# Keystone Architecture

Keystone is a deterministic execution vault that stores immutable evidence of every state transition and enables replay-verifiable truth, provable recovery, and cross-machine identical state.

It wraps complex execution workflows in a proof layer that can show whether execution evidence is reproducible, byte-identical, hash-locked, and independently replay-verifiable.

This public document describes the architecture shape only. It does not expose Keystone's private production engine, recovery internals, canonicalization internals, sync/merge internals, or full test harness.

---

## Core Claim

Keystone converts execution into evidence.

The public proof package demonstrates deterministic, replay-verifiable, byte-identical proof outputs across Keystone self-verification, a clean external repository, and a messy real-world repository.

The verification pattern is:

same input -> same execution path -> same canonical artifact chain -> same proof hash

If the record cannot be reproduced, Keystone does not treat the execution as trusted.

---

## Public Trust Pipeline

The public Keystone proof surface is organized around this trust pipeline:

declared repository/input -> deterministic staged execution -> declared artifacts -> stage manifests -> chained proof record -> replay verification -> final proof hash agreement

Each layer narrows what is allowed to count as truth.

Logs, screenshots, summaries, and operator claims may help investigation, but they do not establish execution truth.

---

## Architectural Layers

### 1. Declared Input Boundary

Keystone begins with a declared input boundary.

This boundary defines what repository, configuration, run root, and execution evidence belong to the verification record.

Evidence outside the declared boundary is not silently trusted.

### 2. Deterministic Staged Execution

Keystone runs execution as a staged pipeline.

Each stage consumes declared inputs and produces declared outputs.

The public proof package documents the evidence model and proof results. The private repository contains the production orchestration implementation.

### 3. Artifact Evidence

Stage outputs become trusted evidence only when they are declared, hashable, and included in the proof record.

Missing, altered, malformed, undeclared, or unverifiable artifacts invalidate trust.

### 4. Stage Manifests

Each stage emits a manifest describing its role in the execution record.

A stage manifest binds together stage identity, declared inputs, declared outputs, artifact hashes, stage status, prior chain state, and resulting chain state.

Invalid or malformed manifests do not establish execution truth.

### 5. Chain Continuity

Keystone links stage records into a chain.

Each stage must connect to the previous verified state.

A broken link, mismatched hash, missing reference, duplicate reference, or invalid chain transition invalidates the proof.

### 6. Replay Verification

A Keystone proof must be replay-verifiable.

Replay checks whether the declared execution record can be reproduced from its evidence.

The public proof package demonstrates replay verification with all stages verified.

### 7. Final Proof Hash

The final proof hash is the commitment to the verified execution record.

If two executions claim to represent the same deterministic record, the final proof hashes must agree.

If the proof hash changes, the verified execution record changed.

### 8. Fail-Closed Rejection

Keystone rejects uncertain execution state.

Unknown fields, missing evidence, malformed records, mismatched hashes, partial artifacts, corrupted state, or conflicting histories must not be accepted as valid proof.

When trust cannot be proven, Keystone fails closed.

### 9. Quarantine Boundary

Ambiguous execution state must be isolated before it is trusted.

Mixed run histories, malformed run folders, invalid checkpoint state, partial records, or conflicting evidence belong behind a quarantine boundary until verification proves they are safe.

Keystone must prefer quarantine over unsafe acceptance.

### 10. Public Verification Surface

The public repository contains proof artifacts and verification scripts.

This allows reviewers to verify the published proof package state without exposing Keystone's private execution engine.

The public verification flow checks proof package artifact hashes, manifest hash agreement, proof hash anchor, published replay evidence, and the documented deterministic replay command pattern.

---

## Public/Private Boundary

Public surface:

- truth model
- invariants
- audit status
- architecture overview
- schemas safe for publication
- proof artifacts
- replay demonstrations
- verification scripts
- validation summaries

Private surface:

- production execution engine
- deterministic orchestration internals
- recovery classifier
- canonicalization and hashing internals
- sync and merge internals
- chaos, corruption, and recovery test harness
- internal notes and design scratchpads

---

## Design Principle

Keystone does not ask whether execution claims to have succeeded.

Keystone asks whether the execution record can be proven.

If the record cannot be proven, Keystone does not trust it.
