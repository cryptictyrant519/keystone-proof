# Keystone Audit Status

Keystone is under active verification and hardening.

This public repository contains the proof surface for Keystone. It does not contain the private production execution engine, proprietary orchestration internals, recovery engine, sync engine, canonicalization internals, or full test harness.

---

## Public Verification Scope

The public proof package demonstrates:

- deterministic replay verification
- proof-hash agreement
- canonical artifact integrity
- independent repository verification
- Keystone self-verification
- manifest hash validation
- replay command documentation
- published proof artifact verification

The public verification flow validates the published proof artifacts. It does not execute the private Keystone engine.

---

## Completed Hardening Areas

The following areas have been audited and hardened in the private Keystone implementation:

- replay artifact path boundary validation
- stage manifest artifact validation
- proof envelope validation
- proof envelope unknown-field rejection
- stage manifest unknown-field rejection
- checkpoint unknown-field rejection
- genesis chain hash verification
- proof verifier parity behavior
- missing artifact rejection
- duplicate stage reference rejection
- tampered final proof rejection
- minimum stage count validation
- repository fingerprint delete and rename coverage
- repository fingerprint executable-bit drift coverage
- tracked Git symlink mode coverage
- untracked symlink coverage
- ignored runtime input policy
- aggregate repository fingerprint domain separation
- symlink hashing domain separation
- tool metadata whitelist behavior
- live pipeline validation on Keystone and external repositories

---

## Active Audit Areas

The following areas remain under active audit:

- run-root policy
- history indexing
- checkpoint indexing
- mixed run-folder handling
- malformed run-folder handling
- crash and recovery behavior
- partial artifact behavior
- lock and interrupted-run behavior
- CLI JSON behavior
- CLI exit-code behavior
- broader real-world repository diversity testing

---

## Verification Position

Keystone should be described as actively hardened and replay-verifiable.

Keystone should not be described as formally proven, fully audited, or production certified until all remaining audit areas are closed.

---

## Public/Private Boundary

Public:

- architecture
- truth model
- invariants
- build governance
- audit status
- schemas
- proof artifacts
- verification scripts
- replay demonstrations

Private:

- production execution engine
- deterministic orchestration internals
- recovery classifier
- canonicalization and hashing internals
- sync and merge internals
- chaos/corruption/recovery test harness
- internal notes and design scratchpads
