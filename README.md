# Keystone

Deterministic execution and replay-verifiable proof infrastructure.

## Core Proof

same input → same execution path → same canonical artifact chain → same proof hash

## What Keystone Demonstrates

Keystone demonstrates a proof model for complex execution pipelines where outputs must be reproducible, replay-verifiable, and tied to canonical artifact integrity.

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

Keystone is positioned as deterministic execution proof infrastructure for:

- CI/CD verification
- DevSecOps workflows
- software supply-chain integrity
- build and release systems
- multi-tool execution orchestration
- AI-assisted development pipelines

AI-assisted development is one use case, not the full identity of Keystone.

## Verification Principle

Keystone is designed around artifact truth, not trust in logs.

The proof model centers on deterministic execution, canonicalized artifacts, replay verification, fail-closed behavior, and proof-hash agreement.
