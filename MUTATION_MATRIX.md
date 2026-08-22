# Keystone Mutation Matrix

This matrix records the mutation cases currently proven by Keystone tests and preserved public evidence.

| Mutation | Expected behavior | Observed result | Evidence status |
|---|---|---|---|
| Remove proof envelope | Reject | `proof_envelope_missing` | Private test |
| Corrupt proof envelope JSON | Reject | `proof_envelope_invalid_json` | Private test |
| Add unknown proof-envelope field | Reject | `proof_envelope_invalid_json` | Private test |
| Change schema version | Reject | `proof_envelope_schema_version_invalid` | Private test |
| Change proof contract version | Reject | `proof_contract_version_invalid` | Private test |
| Change verifier contract version | Reject | `verifier_contract_version_invalid` | Private test |
| Change canonicalization version | Reject | `canonicalization_version_invalid` | Private test |
| Change hash version | Reject | `hash_version_invalid` | Private test |
| Change genesis chain hash | Reject | `proof_genesis_chain_hash_invalid` | Private test |
| Remove run ID | Reject | `proof_envelope_run_id_required` | Private test |
| Invalid final proof | Reject | `proof_envelope_final_proof_invalid` | Private test |
| Mark proof incomplete | Reject | `proof_envelope_incomplete` | Private test |
| Change stage count | Reject | `proof_stage_count_mismatch` | Private test |
| Change stage-manifest count | Reject | `proof_stage_manifest_count_mismatch` | Private test |
| Remove referenced artifact | Reject | `proof_artifact_missing` | Private test |
| Duplicate stage-manifest reference | Reject | `proof_stage_manifest_ref_duplicate` | Private test |
| Escape artifact reference path | Reject | `proof_artifact_path_escape` | Private test |
| Malform artifact hash | Reject | `proof_artifact_hash_invalid` | Private test |
| Change referenced artifact bytes | Reject | `proof_artifact_hash_mismatch` | Private test + preserved tampered-stage proof |
| Cross-run stage-manifest substitution | Reject | `stage_chain_link_mismatch` | Private test |
| Mix verdict from another run | Reject | `proof_artifact_hash_mismatch` | Private test |
| Break stage-chain link | Reject | `stage_chain_link_mismatch` | Private test |
| Tamper final previous-chain hash | Reject | `final_previous_chain_hash_mismatch` | Private test |
| Replace final proof | Reject | `final_proof_mismatch` | Private test + preserved Falco/Scorecard proof-envelope mutations |
| Reorder stages | Reject | `stage_order_mismatch` | Private test |
| Change declared input bytes | Fail replay | `artifact_hash_mismatch` | Private test |
| Change declared output bytes | Fail replay | `artifact_hash_mismatch` | Private test |
| Remove declared input | Fail replay | `replay_artifact_missing` | Private test |
| Remove declared output/artifact | Fail replay | `replay_artifact_missing` | Private test |
| Remove stage manifest | Fail replay | `replay_stage_manifest_missing` | Private test |
| Remove final Keystone verdict | Fail closed | `violation:run_verdict_missing` | Preserved public negative proof |
| Add undeclared input artifact | Ignore as outside declared evidence boundary | Replay remains `pass` | Private test |
| Replay untouched preserved Falco proof | Accept | `SAFE`, seven verified stages | Public proof; fresh Ubuntu, Windows, macOS CI run `32286821142` |

## Interpretation

A mutation listed as rejected or failed is not allowed to become trusted evidence.

The undeclared-input case is intentionally different: evidence not declared by the stage manifest is outside Keystone's verified evidence boundary and therefore does not alter the replay result.

## Public Evidence Boundary

Rows marked `Private test` are test-covered by the private Keystone engine but are not individually preserved as standalone public mutation artifacts.

Rows marked as preserved public evidence have corresponding artifacts under `negative_proofs/` or `release_evidence/`.

The private Keystone engine remains outside this repository.
