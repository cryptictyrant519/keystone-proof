# What Keystone Does Not Guarantee

Keystone verifies execution claims from preserved evidence inside a declared evidence boundary.

Successful verification means the supplied evidence was complete for the evaluated proof contract and passed the verifier's integrity, lineage, artifact, and compatibility checks.

It does not establish every property of the original execution environment or target repository.

---

## Keystone Does Not Guarantee

- that a target repository is secure, defect-free, compliant, or safe to deploy;
- that source code, dependencies, tools, operators, or infrastructure were trustworthy before evidence capture;
- that undeclared inputs, outputs, files, environment state, or external services were included;
- that a successful execution produced a correct business, security, or policy outcome;
- authorization, approval, enforcement, access control, or deployment permission;
- prevention of denial-of-service, resource exhaustion, hardware failure, or unavailable storage;
- confidentiality of evidence that is intentionally placed inside a proof package;
- authenticity of an external identity unless identity evidence is explicitly included and independently validated;
- protection against compromise of the verifier or hashing implementation itself;
- formal proof of correctness, complete audit coverage, or production certification;
- recovery correctness unless the specific recovery claim and its required evidence are preserved and verified;
- deterministic behavior outside the declared compatibility rules and evidence boundary.

---

## What A SAFE Result Means

A `SAFE` verification result means Keystone accepted the supplied proof package under the active verifier contract.

It means the recorded proof lineage, declared artifacts, stage references, verdict, and final proof were mutually consistent for that verification.

It does not convert unrecorded facts into verified facts.

---

## What A Failure Means

A `BLOCKED`, `FAIL`, `INCOMPLETE`, or incompatible result means Keystone did not establish the requested proof claim.

Failure does not automatically prove malicious activity or a defect in the target repository.

It proves only that the supplied evidence could not satisfy the required verification conditions.

---

## Public Proof Scope

The public repository provides proof artifacts, manifests, verification scripts, release evidence, and negative demonstrations.

The public manifest script verifies published enterprise-package file integrity.

Independent `verify-proof` commands require the private Keystone verifier, which is not included in this repository.

Keystone must be described according to the evidence that is actually available for the claim being made.
