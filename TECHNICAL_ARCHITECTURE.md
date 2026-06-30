# KEYSTONE TECHNICAL ARCHITECTURE SPECIFICATION

## 1. Purpose

This specification defines Keystone's technical architecture.

It explains how Keystone preserves canonical evidence, protects deterministic truth, supports recovery, and enables independent verification.

This document is subordinate to `INVARIANTS.txt`, `TRUTH.txt`, `ARCHITECTURE.txt`, and `BUILD_PLAN.txt`.

---

## 2. Scope

Keystone is a ledger-grade, local-first vault system.

Keystone is responsible for preserving canonical evidence and making execution claims independently verifiable.

Keystone is not responsible for authorization, policy decisions, external enforcement, or trust decisions made without evidence.

---

## 3. Definitions

### Canonical Truth

Canonical truth is the committed state defined by canonical bytes, sealed segments, durable WAL records, the manifest, and verified replay.

Derived indexes, operator interpretation, external policy decisions, and unverified recovery state are not canonical truth.

### Evidence

Evidence is preserved system material that can be independently examined to verify an execution claim.

Evidence includes WAL records, sealed segments, manifests, hashes, replay material, and proof artifacts.

### Verification

Verification is the explicit process of checking whether preserved evidence is internally consistent, complete for the claim being evaluated, and compatible with deterministic rules.

Verification must produce an explicit result.

### Replay

Replay is deterministic reconstruction from preserved evidence.

Replay is valid only after compatibility gates pass.

Replay output must match deterministically across machines.

### Recovery

Recovery is the deterministic process of reconstructing safe state after interruption, crash, corruption, missing evidence, or conflict.

Recovery must preserve evidence and must not promote unverified state.

### Determinism

Determinism means the same logical input produces the same logical output across machines under the declared compatibility rules.

Truth paths must not depend on floats, clocks, locale, ambient nondeterminism, unordered serialization, or implementation-specific iteration order.

### Fail Closed

Fail closed means Keystone refuses to promote, accept as canonical, silently repair, or continue unsafe truth-path operation when required evidence cannot be verified.

### Commit

Commit is the durable transition from accepted intent to canonical committed state.

A write is committed only when the WAL is durable, the segment is durable, the manifest is atomically swapped, the manifest is fsynced, and the post-swap manifest verifies.

### Quarantine

Quarantine is isolation for invalid, forked, conflicting, or unverifiable data.

Quarantine is not canonical truth and cannot automatically re-enter canonical truth.

---

## 4. Authority Hierarchy

Keystone follows this authority order:

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

Code is not authority.

---

## 5. Foundational Relationship

The philosophical foundation of Keystone is defined in `specification/FOUNDATIONAL_PRINCIPLES.md`.

The numbered invariants are defined in `INVARIANTS.txt`.

The truth model is defined in `TRUTH.txt`.

The root architecture is defined in `ARCHITECTURE.txt`.

This specification exposes those authority layers in public technical form.

---

## 6. Architectural Invariants

Keystone's architecture preserves the numbered invariants defined in `INVARIANTS.txt`.

The most load-bearing architectural invariants are:

- I-001: Keystone is a ledger-grade local-first vault.
- I-002: No silent data loss is permitted.
- I-090: Commit equals WAL durable, segment durable, manifest atomic swap, and manifest fsync.
- I-100: WAL is required.
- I-102: Manifest is the sole mutable tip pointer.
- I-104: Segments are immutable after reference.
- I-108: Only two crash truths are allowed: committed or not committed.
- I-111: No silent discard of accepted data.
- I-123: Manifest swap must be atomic.
- I-124: Manifest must include monotonic uint64 manifest_seq.
- I-125: Post-swap manifest must be re-read and verified.
- I-126: Manifest must include seal_hash for each referenced segment.
- I-127: WAL truncation is forbidden until manifest fsync and durable WAL checkpoint both exist.
- I-200: Recovery must be deterministic.
- I-202: Recovery must preserve evidence.
- I-205: Recovery must not auto-promote unverified state.
- I-207: Unsafe recovery halts writes.
- I-300: Replay output must match deterministically.
- I-302: No floats, clocks, locale, or ambient nondeterminism on truth paths.
- I-303: Cross-machine identical replay is required.
- I-304: Deterministic replay compatibility gate is required before replay.
- I-500: Canonical serialization is mandatory.
- I-509: Hashing must be versioned.
- I-1700: Truth is hash-chain rooted.
- I-1703: Fork detection is required.
- I-1704: Conflicts must deterministically merge or quarantine.
- I-1705: No silent fork collapse is allowed.
- I-1706: Quarantine directory is mandatory.

Violation of these invariants is out of specification.

---

## 7. Canonical Truth Model

Canonical truth is defined by canonical bytes and a hash-chain-rooted evidence model (I-1700).

Keystone canonical truth consists of:

- durable WAL records for accepted but not fully committed intent (I-100, I-101);
- sealed immutable segments for historical committed state (I-104, I-126);
- the manifest as the sole mutable pointer to current committed state (I-102);
- verified replay output reconstructed from preserved evidence (I-300, I-303).

Index data, derived retrieval state, operator interpretation, external policy decisions, and unverified recovery state are not canonical truth.

---

## 8. Core Components

Keystone's core architecture consists of:

1. WAL
2. Immutable segments
3. Manifest
4. Deterministic recovery
5. Replay verification
6. Quarantine

Each component exists to preserve one or more numbered invariants.

---

## 9. WAL

The WAL is Keystone's append-only accepted-intent log (I-100, I-101).

Accepted writes must enter the WAL before they may become committed state.

The WAL must be durable before commit (I-090).

The WAL may contain checkpoint records.

WAL truncation is forbidden until both conditions exist (I-127):

1. manifest fsync has completed;
2. a durable WAL checkpoint record exists.

The WAL is not optional.

---

## 10. Segments

Segments are sealed immutable data units.

Once a segment is referenced by the manifest, it is no longer mutable (I-104).

Each referenced segment must have a `seal_hash` (I-126).

Mutation of a referenced segment creates invalid state.

Segments preserve immutable historical truth.

---

## 11. Manifest

The manifest is Keystone's sole mutable tip pointer (I-102).

The manifest defines the current committed state.

The manifest must contain:

- monotonic uint64 `manifest_seq` (I-124);
- ordered segment references;
- `seal_hash` for each referenced segment (I-126);
- version fields required for compatibility enforcement.

Manifest replacement must be atomic (I-123).

After manifest swap, Keystone must re-read and verify the post-swap manifest (I-125).

Failure of post-swap verification enters unsafe recovery.

---

## 12. Commit Model

A write is committed only when all required durability boundaries complete (I-090):

1. WAL append is durable.
2. Segment write is durable.
3. Manifest is atomically swapped.
4. Manifest fsync completes.
5. Post-swap manifest verification succeeds.

Anything else is not committed.

There are only two crash truths (I-108):

- committed;
- not committed.

Keystone does not recognize ambiguous commit state.

---

## 13. Recovery Model

Recovery is deterministic (I-200).

Recovery flow:

1. Load manifest.
2. Validate `manifest_seq`.
3. Verify referenced segment existence.
4. Verify segment `seal_hash`.
5. Run compatibility gate checks.
6. Replay WAL after the last durable checkpoint.
7. Reconstruct candidate state.
8. Validate candidate state.
9. Promote only if valid.

Recovery must preserve evidence (I-202).

Recovery must not auto-promote unverified state (I-205).

Unsafe recovery halts writes (I-207).

---

## 14. Verification Model

Verification determines whether preserved evidence is internally consistent, complete for the claim being evaluated, and compatible with the deterministic rules in effect.

Verification must produce an explicit result.

Verification outcomes are:

- verified;
- failed;
- blocked because required evidence is missing or unverifiable.

Verification never silently succeeds.

Verification failure never promotes state.

Verification failure terminates the attempted verification path with an explicit result.

Commit-path structural verification and independent evidence verification are distinct verification classes.

Commit-path structural verification checks whether newly written state satisfies commit requirements.

Independent evidence verification checks whether preserved evidence supports an execution claim.

---

## 15. Determinism Model

Determinism is mandatory on every truth path.

The same logical input must produce the same logical output across machines (I-303).

Keystone forbids truth-path dependence on:

- floats (I-700);
- clocks (I-302);
- locale (I-302);
- ambient environmental state (I-302);
- unordered serialization;
- implementation-specific iteration order.

Canonical serialization is mandatory (I-500).

Hashing must be stable and versioned (I-509).

Replay requires a deterministic replay compatibility gate before replay begins (I-304).

---

## 16. Failure Model

Keystone fails closed.

Failing closed means Keystone refuses to promote, accept as canonical, or silently repair state when required evidence cannot be verified.

Failure behavior must be explicit.

Keystone does not perform silent repair.

Keystone does not perform implicit recovery.

Invalid, conflicting, missing, forked, or unverifiable data must be surfaced.

Unsafe states must be explicitly entered.

---

## 17. Operational States

Keystone exposes these operational states:

### SAFE

The system has verified canonical state and may accept writes.

### WARNING

The system has detected a non-canonical issue that requires operator attention but does not currently invalidate the canonical manifest-defined state.

### BLOCKED

The system cannot safely proceed with the requested operation because required evidence, compatibility, durability, or verification conditions are not satisfied.

### ERROR

The system has encountered invalid, missing, corrupted, conflicting, or unverifiable canonical evidence.

In ERROR state, Keystone must not silently promote state.

When ERROR affects recovery or canonical truth, writes must halt until safe recovery completes or explicit operator action isolates the invalid evidence.

---

## 18. Quarantine Model

Quarantine isolates invalid, forked, or unverifiable data.

The quarantine directory is mandatory (I-1706).

Quarantine is never part of canonical truth.

Quarantined data is never referenced by the manifest.

Quarantined data requires explicit operator action before reconsideration.

Reconsideration may only occur through re-verification against the active authority layer.

Automatic reintegration from quarantine is forbidden.

---

## 19. Privacy and Index Boundary

Indexing is a derived retrieval layer, not canonical truth (I-1800).

Indexing must never outrank durability, WAL, segment, or manifest writes (I-1801).

Protected fields must not leak into searchable indexes (I-1802).

Redacted fields must not be indexed or stored as plain values (I-1803).

Encrypted fields must not be indexed or stored as plain values (I-1804).

Non-searchable fields must remain outside searchable indexes (I-1805).

Context packs must exclude redacted and encrypted fields (I-1806).

Index limits must be explicit and enforced (I-1807).

Index writes are blocked while durability work is pending.

---

## 20. External Boundary: AuthenX

Keystone preserves evidence.

AuthenX evaluates policy against evidence.

The boundary between Keystone and AuthenX is evidence export, not authority transfer.

Keystone may expose preserved evidence as an immutable proof reference, canonical proof package, or replay-verifiable evidence package.

Keystone must not give external policy systems mutable access to canonical evidence.

Policy decisions do not modify canonical evidence.

Authorization, enforcement, approval, denial, and compliance decisions are outside Keystone's scope.

---

## 21. Audit Standard

Every Keystone architectural claim must satisfy four requirements:

1. Definition — the claim must be explicitly defined.
2. Authority alignment — the claim must align with the governing authority layer.
3. Architectural boundary — the claim must remain inside Keystone's defined scope.
4. Independent verification — the claim must be verifiable from preserved evidence, implementation behavior, or documented proof material.

Claims that do not satisfy this standard must be clarified, weakened, or removed.

---

## 22. Architectural Success Criteria

Keystone succeeds architecturally when an independent reviewer can verify that:

1. accepted writes are preserved in the WAL before commit;
2. committed state is represented by sealed immutable segments;
3. the manifest is the sole mutable tip pointer;
4. manifest sequence regression is detected;
5. referenced segment seal hashes are verified;
6. replay compatibility is checked before replay;
7. replay output is deterministic across machines;
8. recovery does not promote unverified state;
9. invalid, forked, conflicting, or unverifiable data is isolated or surfaced;
10. quarantine never becomes canonical truth automatically;
11. index data remains derived and non-canonical;
12. policy evaluation does not modify canonical evidence;
13. verification failure produces explicit failure rather than silent success.

If these criteria are not met, Keystone is not architecturally complete.
