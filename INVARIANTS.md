# Keystone Invariants

Keystone is governed by invariants: rules that must remain true for an execution record to be trusted.

If an invariant cannot be proven, Keystone treats the execution as untrusted.

---

## 1. Artifact Truth Over Execution Claims

Logs, summaries, status messages, screenshots, and operator claims do not establish truth.

Only verifiable artifacts can establish execution truth.

---

## 2. Deterministic Replay

The same input must produce the same execution path, the same canonical artifact chain, and the same proof hash.

If replay diverges, verification fails.

---

## 3. Canonical Artifact Integrity

Artifacts must be normalized, hash-locked, and chained into the execution record.

If an artifact is missing, altered, malformed, or unverifiable, the proof is invalid.

---

## 4. Chain Continuity

Each verified stage must connect to the previous verified stage.

A broken chain, missing link, mismatched hash, or invalid stage reference invalidates the proof.

---

## 5. Fail-Closed Verification

Keystone must reject uncertain execution states.

Unknown, malformed, missing, or conflicting evidence must not be accepted as valid proof.

---

## 6. Explicit Evidence Boundaries

Keystone only verifies what is inside the declared evidence boundary.

Files, inputs, outputs, or metadata outside that boundary are not silently trusted.

---

## 7. Replay-Verifiable Proof

A proof is valid only if it can be independently replayed and verified from its declared evidence.

A proof that cannot be reproduced is not trusted.

---

## 8. No Trust From Authority Alone

A trusted user, successful command, passing log, or completed process does not prove correctness.

Authority does not replace verification.

---

## 9. Schema-Governed Records

Execution records must match their declared schema.

Unknown fields, missing required fields, malformed values, or incompatible versions must be rejected.

---

## 10. Quarantine Before Trust

Ambiguous, corrupted, mixed, partial, or conflicting execution state must be isolated before it is trusted.

Keystone must prefer quarantine over unsafe acceptance.

---

## Core Rule

If Keystone cannot prove the execution record, Keystone must not trust the execution record.
