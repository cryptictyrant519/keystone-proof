# Keystone

Deterministic execution vault for replay-verifiable truth, provable recovery, and cross-machine identical state.

## Core Proof

same input → same execution path → same canonical artifact chain → same proof hash

## What Keystone Is

Keystone is a deterministic execution vault that converts execution into immutable evidence.

Its purpose is to preserve execution truth through deterministic state transitions, replay-verifiable proof, provable recovery, and canonical evidence records.

The public package in this repository contains proof artifacts only. It does not contain Keystone's private source code or internal implementation.

## Repository Scope

This repository is Keystone's public proof surface.

It contains:

- proof artifacts
- verification scripts
- public architecture documentation
- governance documents
- replay demonstration material
- validation summaries

It does not contain:

- Keystone's private production source code
- proprietary execution engine internals
- recovery engine internals
- sync or merge internals
- canonicalization or hashing internals
- private test harnesses
- private design notes

This repository is intended for:

- platform engineering reviewers
- DevSecOps teams
- software supply-chain reviewers
- AI infrastructure teams
- governance and audit reviewers
- technical evaluators who need to inspect Keystone's public proof surface

## Public Governance Documents

Recommended review order:

1. `WHY_KEYSTONE.md` — why Keystone exists and why execution claims are not enough
2. `TRUTH.md` — what Keystone treats as execution truth
3. `INVARIANTS.md` — rules that must remain true for execution records to be trusted
4. `ARCHITECTURE.md` — public architecture shape and trust pipeline
5. `AUDIT_STATUS.md` — current verification posture and public/private boundary

## Proof Package

See:

`Keystone_Enterprise_Proof/`

Contents include:

- technical brief
- architecture diagram
- deterministic demo video
- replay verification artifacts
- independent repository verification
- Keystone self-verification
- SHA256 manifest
- replay commands

## Scope

Keystone is a deterministic execution vault that stores immutable evidence of every state transition and guarantees replay-verifiable truth, provable recovery, and cross-machine identical state.

This repository publishes Keystone's public proof surface, including governance documentation, architecture documentation, audit and verification status, the enterprise proof package, replay-verification artifacts, verification scripts, and reproducibility evidence.

The purpose of this repository is to enable independent evaluation of Keystone's verifiability, governance model, and proof guarantees. Keystone is intentionally structured so that its guarantees can be independently validated without access to the underlying execution engine.

This repository allows reviewers to inspect Keystone's architectural guarantees, review system invariants and governance commitments, validate proof artifacts and verification outputs, reproduce verification procedures, and independently confirm evidence integrity and replay-verifiable truth.

This repository does not include Keystone's private execution engine, orchestration and scheduling internals, deterministic pipeline implementation, vault internals, vault schemas, vault configurations, proprietary state-transition systems, proprietary recovery systems, proprietary evidence-preservation systems, production deployment infrastructure, or operational vault product code.

The underlying deterministic execution vault, its operational implementation, and its proprietary execution technologies remain private. This public release focuses on the reproducibility, verification, and evidence-preservation model that makes Keystone a trustable primitive for agents, CI/CD systems, enterprise automation, and regulated environments.

## Verification Principle

Keystone is designed around artifact truth, not trust in logs.

The proof model centers on deterministic execution, canonicalized artifacts, replay verification, fail-closed behavior, and proof-hash agreement.
