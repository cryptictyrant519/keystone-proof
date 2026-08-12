# Keystone Video Proof Protocol

## Verified prerequisites
- Public proof repo: clean before protocol file creation; branch main synced with origin/main.
- Keystone engine and all six tool repositories: clean and synced with their tracked branches.

## Verified tool paths
- Teradox: /home/swaa1/teradox/target/release/teradox
- SmartStruct: /home/swaa1/SmartStruct_Rebuild
- Polyglot-IR: /home/swaa1/polyglot-ir/target/release/pir-cli
- DAE: /home/swaa1/DAEngine/dae-engine.out
- CodeScaffolder: /home/swaa1/codescaffolder
- Canonix: /home/swaa1/canonix/target/release/enforce_cli
- Keystone doctor: SAFE; repo path, run root, and all six configured tool paths verified.

## Recording sequence

### 1. Doctor

```bash
cd /home/swaa1/Keystone && KEYSTONE_TERADOX=/home/swaa1/teradox/target/release/teradox KEYSTONE_SMARTSTRUCT=/home/swaa1/SmartStruct_Rebuild KEYSTONE_POLYGLOT_IR=/home/swaa1/polyglot-ir/target/release/pir-cli KEYSTONE_DAE=/home/swaa1/DAEngine/dae-engine.out KEYSTONE_CODESCAFFOLDER=/home/swaa1/codescaffolder KEYSTONE_CANONIX=/home/swaa1/canonix/target/release/enforce_cli go run ./cmd/keystone doctor --repo /home/swaa1/keystone-proof --run-root /tmp/keystone_video_proof
```

Expected authoritative result: `Result: SAFE`

### 2. Fresh seven-stage run

```bash
cd /home/swaa1/Keystone && KEYSTONE_TERADOX=/home/swaa1/teradox/target/release/teradox KEYSTONE_SMARTSTRUCT=/home/swaa1/SmartStruct_Rebuild KEYSTONE_POLYGLOT_IR=/home/swaa1/polyglot-ir/target/release/pir-cli KEYSTONE_DAE=/home/swaa1/DAEngine/dae-engine.out KEYSTONE_CODESCAFFOLDER=/home/swaa1/codescaffolder KEYSTONE_CANONIX=/home/swaa1/canonix/target/release/enforce_cli go run ./cmd/keystone run --repo /home/swaa1/keystone-proof --run-root /tmp/keystone_video_proof
```

Proven result: `Result: SAFE`, `Stages checked: 7`, Run ID `ba7f8e0a6145a9d9-000002`, Final proof `sha256:93042b604ccef7cce7b44fed40cc424ef8d9d4859cc0c616e2c09478d8029fb8`

### 3. Independent proof verification

```bash
cd /home/swaa1/Keystone && go run ./cmd/keystone pipeline verify-proof --run-id ba7f8e0a6145a9d9-000002 --run-root /tmp/keystone_video_proof
```

Proven result: `Result: SAFE`, `Verified stages: 7`, Final proof `sha256:93042b604ccef7cce7b44fed40cc424ef8d9d4859cc0c616e2c09478d8029fb8`

### 4. Replay

```bash
cd /home/swaa1/Keystone && go run ./cmd/keystone replay --run-id ba7f8e0a6145a9d9-000002 --run-root /tmp/keystone_video_proof
```

Proven result: `Result: SAFE`, `Verified stages: 7`; stages: `teradox`, `smartstruct`, `polyglot_ir`, `dae`, `codescaffolder`, `canonix`, `keystone`

### 5. Record original proof-envelope hash

```bash
sha256sum /tmp/keystone_video_proof/ba7f8e0a6145a9d9-000002/proof_envelope.json
```

Proven hash: `28523f09486a02dcd20c54f03582174f288562d21926d86476ad872898eac26f`

### 6. Create disposable tamper copy

```bash
rm -rf /tmp/keystone_video_tamper && cp -a /tmp/keystone_video_proof/ba7f8e0a6145a9d9-000002 /tmp/keystone_video_tamper
```

### 7. Prove disposable copy initially matches original

```bash
sha256sum /tmp/keystone_video_tamper/proof_envelope.json
```

Proven pre-tamper hash: `28523f09486a02dcd20c54f03582174f288562d21926d86476ad872898eac26f`

### 8. Tamper only final_proof

```bash
python3 -c 'import json; p="/tmp/keystone_video_tamper/proof_envelope.json"; d=json.load(open(p)); d["final_proof"]="sha256:"+"0"*64; open(p,"w").write(json.dumps(d,separators=(",",":"))+"\n")'
```

### 9. Verify tampered copy

```bash
cd /home/swaa1/Keystone && go run ./cmd/keystone pipeline verify-proof --run-id keystone_video_tamper --run-root /tmp
```

Required result: `Result: BLOCKED`, `Failed surface: proof_envelope`, `STATE: FAIL_CLOSED`

### 10. Verify untouched original again

```bash
cd /home/swaa1/Keystone && go run ./cmd/keystone pipeline verify-proof --run-id ba7f8e0a6145a9d9-000002 --run-root /tmp/keystone_video_proof
```

Required result: `Result: SAFE`, `Verified stages: 7`

## Cold public verification

### 11. Prove fresh clone is clean

```bash
cd /tmp/keystone-proof-video-clone && git status --short --branch
```

Proven result: `## main...origin/main`

### 12. Verify public manifest and proof anchor

```bash
cd /tmp/keystone-proof-video-clone && bash verify/verify-manifest.sh
```

Required result: `PASS: manifest and proof hash verified`

Proven anchor: `974c0de7e50ab71a22e5f035a938b33374084d173dcc5dbd7925a4402148774f`

### 13. Independently verify published self-proof

```bash
cd /home/swaa1/Keystone && go run ./cmd/keystone pipeline verify-proof --run-id keystone_self_proof_e02a09f --run-root /tmp/keystone-proof-video-clone/release_evidence
```

Required result:
- `Result: SAFE`
- Run ID `a77d6316edb93f99-000001`
- `Verified stages: 7`
- Final proof `sha256:e2fc2ef66767172b09f13fef7c3dce5747bfd297cd0db622b891f9c2c175bedd`

### 14. Verify public negative proof

```bash
cd /home/swaa1/Keystone && go run ./cmd/keystone pipeline verify-proof --run-id keystone-cold-negative --run-root /tmp
```

Required result:
- `Result: BLOCKED`
- `Failed surface: proof_envelope`
- `STATE: FAIL_CLOSED`

### 15. Verify untouched published Scorecard proof

```bash
cd /home/swaa1/Keystone && go run ./cmd/keystone pipeline verify-proof --run-id scorecard_proof_9ad561d838321315 --run-root /tmp/keystone-proof-video-clone/external_proofs
```

Required result:
- `Result: SAFE`
- Run ID `9ad561d838321315-000001`
- `Verified stages: 7`
- Final proof `sha256:184e491c66bcffebf92890d3d906001f85dfe5095d539475fbe6169b08e4ca4c`


## Cleanup / Reset Instructions

- Do not modify Keystone engine source or any external tool source.
- Do not modify the published proof packages or proof anchor.
- Tampering is permitted only inside the disposable `/tmp/keystone_video_tamper` copy.
- The original local run at `/tmp/keystone_video_proof/ba7f8e0a6145a9d9-000002` must remain untouched after creation.
- The public clone at `/tmp/keystone-proof-video-clone` must remain an untouched fresh clone during the proof sequence.
- If rehearsal requires a reset, return only the temporary video-proof state to the pre-recording condition and restart the frozen sequence from Step 1.
- Never repair or improvise during recording; a failed command ends that rehearsal/recording attempt.

## Spoken Claim Boundaries

Allowed claims:
- Keystone executed its configured deterministic seven-stage verification pipeline.
- Keystone returned `SAFE`.
- The run produced a proof envelope with a run identifier and final proof hash.
- Keystone independently verified the proof envelope.
- Keystone replayed the recorded run and verified all seven stage artifacts.
- A deliberately tampered disposable copy was rejected `FAIL_CLOSED`.
- The untouched original remained valid.
- A fresh clone reproduced the public manifest and proof-anchor verification.

Do not claim:
- authorization
- access control
- runtime enforcement
- AI judgment
- universal correctness
- universal security
- compliance certification
- facts outside the supplied evidence

Core boundary: **SAFE means the supplied evidence passed Keystone's configured deterministic verification checks.**

## Recording Order

Run the proven demo sequence in this exact order:

1. Doctor
2. Fresh seven-stage run
3. Independent proof verification
4. Replay
5. Record original proof-envelope hash
6. Create disposable tamper copy
7. Prove disposable copy initially matches original
8. Tamper only `final_proof`
9. Verify tampered copy returns `FAIL_CLOSED`
10. Verify untouched original again
11. Prove fresh public clone is clean
12. Verify public manifest and proof anchor
13. Independently verify published self-proof
14. Verify public negative proof
15. Verify untouched published Scorecard proof

For the final recording, this sequence will be automated so Rob launches the demo with one command and does not manually type each proof command.
