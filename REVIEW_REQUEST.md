# Keystone Adversarial Review Request

I am looking for rigorous technical review of Keystone's public proof surface.

Please try to break the claims, not validate them politely.

Start here:

`REVIEWER_PATH.md`

Then inspect:

- `INVARIANT_CHECK_MAP.md`
- `MUTATION_MATRIX.md`
- `CLEAN_MACHINE_REPRODUCTION.md`
- `negative_proofs/`
- `release_evidence/`
- `WHAT_KEYSTONE_DOES_NOT_GUARANTEE.md`

Please look for:

- unsupported or overstated claims;
- evidence-boundary mistakes;
- mutation cases that could incorrectly verify;
- missing required evidence;
- replay or reproducibility weaknesses;
- ambiguity in expected failure behavior;
- ways malformed, mixed, stale, substituted, or incomplete evidence could be accepted;
- weaknesses created by the private verifier boundary.

Public verification command:

`bash verify/verify-manifest.sh`

Expected final output:

`PASS: manifest and proof hash verified`

Please report criticism directly, including findings that weaken Keystone's current claims.

With permission, substantive feedback and Keystone's response will be recorded in `REVIEW_FEEDBACK.md`.
