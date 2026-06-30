# KEYSTONE AUDIT STANDARD

## 1. Purpose

This document defines the audit standard for Keystone architectural, implementation, verification, and operational claims.

It exists to prevent unsupported claims, architectural drift, boundary confusion, and unverifiable assertions.

A Keystone claim is valid only when it can be defined, bounded, aligned with authority, and independently verified.

---

## 2. Scope

This standard applies to:

- public specifications;
- authority documents;
- architecture documents;
- implementation claims;
- recovery claims;
- replay claims;
- verification claims;
- release and operational claims.

This standard does not create new Keystone architecture.

It defines how Keystone claims are judged.

---

## 3. Claim Requirements

Every Keystone claim must satisfy four requirements.

### 3.1 Definition

The claim must be explicitly defined.

A reviewer must be able to determine what the claim means without guessing.

Undefined terms must be defined or removed.

### 3.2 Authority Alignment

The claim must align with Keystone's authority hierarchy:

1. Invariants
2. Truth
3. Architecture
4. Build plan
5. Repository structure
6. Schemas
7. Implementation
8. Verification
9. Release and operations

No lower layer may weaken, bypass, or redefine a higher layer.

### 3.3 Architectural Boundary

The claim must remain inside Keystone's defined scope.

If a claim belongs to AuthenX, external policy evaluation, authorization, enforcement, user trust, deployment policy, or operational preference, it must not be presented as a Keystone architectural guarantee.

### 3.4 Independent Verification

The claim must be verifiable from preserved evidence, deterministic replay, implementation behavior, tests, proof material, or documented operational artifacts.

Claims that cannot be independently verified must be weakened, clarified, moved, or removed.

---

## 4. Unsupported Claims

A claim is unsupported when it lacks one or more of:

- a clear definition;
- authority alignment;
- an architectural boundary;
- implementation evidence;
- verification evidence;
- preserved proof material;
- deterministic replay support;
- documented operational evidence.

Unsupported claims are not Keystone guarantees.

---

## 5. Boundary Drift

Boundary drift occurs when Keystone is described as doing work outside its scope.

Examples of boundary drift include claiming Keystone:

- authorizes actions;
- approves actions;
- denies actions;
- enforces policy;
- decides compliance;
- assigns trust without evidence;
- modifies canonical evidence based on external policy;
- treats derived indexes as canonical truth.

Boundary drift must be corrected.

---

## 6. Evidence Standard

Evidence must be preserved in a form that can be independently examined.

Valid evidence may include:

- WAL records;
- sealed segments;
- manifests;
- `seal_hash` values;
- hash-chain material;
- replay artifacts;
- compatibility markers;
- proof envelopes;
- verification output;
- test output;
- release artifacts;
- operator-visible failure material.

Evidence must not depend on trust in an operator, hidden state, undocumented behavior, or unverifiable environment assumptions.

---

## 7. Verification Standard

Verification must produce an explicit result.

Silent success is invalid.

Silent failure is invalid.

Verification results must make clear whether the claim was:

- verified;
- not verified;
- blocked because required evidence was missing, incompatible, or unverifiable.

A blocked verification is not a successful verification.

---

## 8. Determinism Standard

Deterministic claims must identify the deterministic boundary being claimed.

Truth-path determinism requires:

- canonical serialization;
- versioned hashing;
- replay compatibility enforcement;
- stable ordering;
- no floats;
- no clock dependence;
- no locale dependence;
- no ambient nondeterminism;
- no implementation-specific iteration dependence.

If a deterministic claim cannot be replayed or independently reproduced, it is not a valid Keystone deterministic claim.

---

## 9. Recovery Standard

Recovery claims must show that recovery:

- is deterministic;
- preserves evidence;
- does not auto-promote unverified state;
- halts writes in unsafe recovery;
- verifies manifest sequence;
- verifies referenced segment existence;
- verifies referenced segment `seal_hash`;
- passes compatibility gates before replay;
- promotes only validated candidate state.

A recovery path that silently repairs, silently discards, or silently promotes state is invalid.

---

## 10. Quarantine Standard

Quarantine claims must preserve the following rules:

- quarantine is mandatory for invalid, forked, conflicting, or unverifiable data that must be isolated;
- quarantine is not canonical truth;
- quarantined data is never referenced by the manifest;
- automatic reintegration is forbidden;
- reconsideration requires explicit operator action;
- reconsideration requires re-verification against the active authority layer.

Quarantine is isolation, not repair.

---

## 11. Privacy and Index Standard

Indexing is a derived retrieval layer.

Index claims must preserve the following rules:

- indexes are not canonical truth;
- indexes must not outrank durability writes;
- protected fields must not leak into searchable indexes;
- redacted fields must not be indexed or stored plainly;
- encrypted fields must not be indexed or stored plainly;
- non-searchable fields must remain outside searchable indexes;
- context packs must exclude redacted and encrypted fields;
- index limits must be explicit and enforced.

Index behavior must never redefine canonical truth.

---

## 12. AuthenX Boundary Standard

Keystone preserves evidence.

AuthenX evaluates policy against evidence.

A Keystone claim must not describe AuthenX policy evaluation as Keystone authorization, approval, denial, enforcement, or compliance judgment.

The Keystone/AuthenX boundary is valid only when:

- Keystone exports immutable evidence, proof references, proof packages, or replay-verifiable evidence packages;
- AuthenX receives evidence for evaluation;
- AuthenX does not receive mutable canonical evidence;
- policy verdicts do not modify Keystone canonical truth.

---

## 13. Audit Outcome

An audit finding must be classified as one of:

### Valid

The finding identifies a real defect, unsupported claim, boundary issue, missing definition, or unverifiable assertion.

### Partially Valid

The finding identifies a real issue but overstates its scope or misclassifies the defect.

### Invalid

The finding contradicts the authority documents, verified implementation evidence, preserved proof material, or explicit specification text.

### Documentation Gap

The architecture or implementation is correct, but the specification does not expose the reasoning clearly enough for independent review.

### Implementation Gap

The specification is correct, but implementation evidence is missing, incomplete, or not yet verified.

---

## 14. Final Rule

Keystone does not rely on persuasion.

Keystone relies on preserved evidence, deterministic replay, explicit boundaries, and independent verification.

A claim that cannot survive this audit standard must not be presented as a Keystone guarantee.
