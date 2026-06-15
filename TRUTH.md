# Keystone Truth Model

## Purpose

Keystone exists to establish execution truth for complex deterministic workflows.

Execution truth is not derived from claims, logs, timestamps, status messages, or operator assertions.

Execution truth is derived from verifiable artifacts produced by execution.

---

## Truth Sources

Keystone recognizes only verifiable artifacts as sources of truth.

Examples include:

- stage manifests
- artifact hashes
- proof chains
- deterministic outputs
- replay verification results
- checkpoint records

These artifacts form a chain of evidence.

---

## Non-Truth Sources

The following are not considered truth:

- logs
- console output
- screenshots
- user statements
- operator claims
- execution summaries
- status messages

These may assist investigation but cannot establish truth.

---

## Establishing Truth

Truth is established when:

1. inputs are identified
2. execution produces canonical artifacts
3. artifacts are chained into verifiable records
4. replay verification succeeds
5. proof hashes agree

When these conditions hold, execution can be independently verified.

---

## Truth Rejection

Truth is rejected when:

- artifacts are missing
- hashes differ
- replay fails
- chain verification fails
- manifests are invalid
- required evidence is absent

Keystone fails closed.

Unverifiable execution is treated as untrusted execution.

---

## Verification Principle

same input

→ same execution path

→ same canonical artifact chain

→ same proof hash

A valid execution must be reproducible and independently verifiable.

If verification cannot be reproduced, truth has not been established.
