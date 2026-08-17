# Keystone Release Evidence

This directory contains Keystone public release proof evidence.

It includes the current Keystone self-proof package and external repository proof packages generated through the configured Keystone pipeline.

Each proof package is stored as a self-contained directory containing:

- `proof_envelope.json`
- stage manifests
- recorded stage inputs
- recorded stage outputs
- Keystone verdict
- deterministic proof lineage material
- package-specific `README.md`

---

# Current Keystone Self-Proof

## Proof Type

Keystone self-proof.

## Source Commit

`e02a09f`

## Project Verified

`/home/tyrant/Keystone`

## Run ID

`a77d6316edb93f99-000001`

## Proof Directory

`release_evidence/keystone_self_proof_e02a09f`

## Final Proof

`sha256:e2fc2ef66767172b09f13fef7c3dce5747bfd297cd0db622b891f9c2c175bedd`

## Observed Verification Results

Doctor:

`SAFE`

Pipeline run:

`SAFE`

Independent verify-proof:

`SAFE`

Verified stages:

`7`

---

# External Proof Packages

## Sigstore

Proof directory:

`release_evidence/sigstore_proof_fa22f0b`

Source commit:

`fa22f0b`

Run ID:

`cfd781df3fd03186-000002`

Final proof:

`sha256:8540cf5dadacf8123b0848a6071693f04e8feb01048cca8a4928f4b68997f422`

Observed results:

`SAFE` doctor, `SAFE` pipeline run, `SAFE` independent verify-proof, `SAFE` copied package verify-proof, `7` verified stages.

## OpenSSF Scorecard

Proof directory:

`release_evidence/scorecard_proof_916bfc57`

Source commit:

`916bfc57`

Run ID:

`9ad561d838321315-000002`

Final proof:

`sha256:184e491c66bcffebf92890d3d906001f85dfe5095d539475fbe6169b08e4ca4c`

Observed results:

`SAFE` doctor, `SAFE` pipeline run, `SAFE` independent verify-proof, `SAFE` copied package verify-proof, `7` verified stages.

## Kubernetes

Proof directory:

`release_evidence/kubernetes_proof_03cec89e`

Source commit:

`03cec89e`

Run ID:

`802146fac3b93d2b-000001`

Final proof:

`sha256:b9206b576d996171653333b500a42507812fd49e1eeea836b69f429a1c0f9ea0`

Observed results:

`SAFE` doctor, `SAFE` pipeline run, `SAFE` independent verify-proof, `SAFE` copied package verify-proof, `7` verified stages.


## Falco

Proof directory:

`release_evidence/falco_proof_13074749`

Source commit:

`13074749`

Run ID:

`63372de631f6de56-000001`

Final proof:

`sha256:8bee504181f99f34724af3dd0423e974174392273ba673ea809f28851ce15cd5`

Observed results:

`SAFE` doctor, `SAFE` pipeline run, `SAFE` independent verify-proof, `SAFE` replay, `SAFE` copied package verify-proof, `7` verified stages.

---

# Status

This directory is the current public release evidence surface.

Reviewers can inspect each package from disk and use the package-specific README files for verification commands and evidence details.
