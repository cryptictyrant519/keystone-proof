# Keystone Threat Model

## Purpose

This document defines the threats addressed by Keystone's preserved execution evidence and verification model.

It applies only to claims inside a declared evidence boundary and active verifier contract.

It does not expand Keystone's implementation, authorization, policy, deployment, or security-audit scope.

---

## Protected Assets

Keystone is designed to protect the verifiability of:

- declared execution inputs;
- declared stage outputs;
- stage manifests;
- artifact hashes;
- stage-chain continuity;
- proof envelopes;
- Keystone verdicts;
- final proof hashes;
- published proof-package manifests.

The protected property is evidence integrity and verifiability.

---

## Trust Boundaries

### Declared Evidence Boundary

Only declared inputs, outputs, metadata, and artifacts are evaluated.

Undeclared environment state, external services, files, or operator knowledge are outside the verified claim.

### Execution Boundary

The execution environment may produce evidence, but successful execution alone is not trusted as proof.

### Verification Boundary

The verifier determines whether supplied evidence satisfies the active proof and verifier contracts.

### Public Repository Boundary

The public repository contains proof artifacts, specifications, manifests, verification material, and negative demonstrations.

It does not contain the private Keystone execution engine or private verifier implementation.

---

## Adversary Capabilities Considered

The verification model assumes an adversary or faulty process may attempt to:

- modify a declared artifact;
- replace a stage manifest;
- alter a proof envelope;
- alter the final proof hash;
- remove required evidence;
- provide malformed or incompatible records;
- break stage-chain continuity;
- introduce unknown fields;
- mix partial or conflicting run material;
- present logs, screenshots, or status output as proof without supporting artifacts;
- change published enterprise-package files after their hashes were recorded.

---

## Expected Detection And Response

When required evidence is missing, altered, malformed, incompatible, conflicting, or unverifiable, Keystone must not establish the requested trust claim.

Expected responses include:

- `BLOCKED`;
- `FAIL`;
- `FAIL_CLOSED`;
- incomplete or incompatible verification;
- explicit failed surface and path information when available.

Verification failure must not silently become successful verification.

---

## Demonstrated Negative Cases

The public repository contains preserved demonstrations for:

- a missing Keystone verdict;
- a tampered proof envelope;
- a tampered stage manifest.

These demonstrations show fail-closed rejection of intentionally invalid copied proof material.

They are not security audits of the target repository.

---

## Threats Not Fully Addressed By Proof Verification

Keystone proof verification does not by itself prevent or establish protection against:

- compromise of the verifier implementation;
- compromise of the hashing implementation;
- malicious evidence omitted before the declared boundary was formed;
- false external identity claims without independent identity evidence;
- denial-of-service or resource exhaustion;
- hardware, kernel, filesystem, or storage compromise outside the verified evidence;
- confidentiality loss from intentionally published proof contents;
- vulnerable, malicious, or incorrect source code and dependencies;
- incorrect business, security, compliance, or policy outcomes;
- unauthorized execution or deployment;
- collusion by all evidence producers before evidence capture.

---

## Cryptographic Boundary

The public proof package uses SHA-256 hashes to detect changes to published files and proof material.

Hash agreement establishes content agreement for the evaluated bytes.

A hash alone does not establish publisher identity, execution authorization, or the truth of facts that were never included in the evidence.

---

## Recovery Boundary

Recovery claims are verified only when the specific recovery evidence required for that claim is preserved inside the declared evidence boundary.

The public proof surface must not be treated as proof of every private recovery behavior.

---

## Core Security Position

Keystone does not assume that execution, operators, tools, or status output are trustworthy.

It evaluates whether preserved evidence supports the specific execution claim being verified.

Evidence outside that claim remains unverified.
