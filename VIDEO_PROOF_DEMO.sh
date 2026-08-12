#!/usr/bin/env bash
set -eu
PS4='$ '
set -x

ENGINE=/home/swaa1/Keystone
RUN_ROOT=/tmp/keystone_video_proof
PUBLIC_CLONE=/tmp/keystone-proof-video-clone
TAMPER=/tmp/keystone_video_tamper

section() {
  printf '\n============================================================\n%s\n============================================================\n' "$1"
  sleep 1
}

section "KEYSTONE VIDEO PROOF — START"

section "1/15 — TOOLCHAIN DOCTOR"
cd "$ENGINE"
KEYSTONE_TERADOX=/home/swaa1/teradox/target/release/teradox \
KEYSTONE_SMARTSTRUCT=/home/swaa1/SmartStruct_Rebuild \
KEYSTONE_POLYGLOT_IR=/home/swaa1/polyglot-ir/target/release/pir-cli \
KEYSTONE_DAE=/home/swaa1/DAEngine/dae-engine.out \
KEYSTONE_CODESCAFFOLDER=/home/swaa1/codescaffolder \
KEYSTONE_CANONIX=/home/swaa1/canonix/target/release/enforce_cli \
go run ./cmd/keystone doctor --repo /home/swaa1/keystone-proof --run-root "$RUN_ROOT"

section "2/15 — FRESH SEVEN-STAGE RUN"
KEYSTONE_TERADOX=/home/swaa1/teradox/target/release/teradox \
KEYSTONE_SMARTSTRUCT=/home/swaa1/SmartStruct_Rebuild \
KEYSTONE_POLYGLOT_IR=/home/swaa1/polyglot-ir/target/release/pir-cli \
KEYSTONE_DAE=/home/swaa1/DAEngine/dae-engine.out \
KEYSTONE_CODESCAFFOLDER=/home/swaa1/codescaffolder \
KEYSTONE_CANONIX=/home/swaa1/canonix/target/release/enforce_cli \
go run ./cmd/keystone run --repo /home/swaa1/keystone-proof --run-root "$RUN_ROOT"

RUN_ID="$(find "$RUN_ROOT" -mindepth 1 -maxdepth 1 -type d -printf '%T@ %f\n' | sort -nr | head -n1 | cut -d' ' -f2-)"
test -n "$RUN_ID"
printf '\nFRESH RUN ID: %s\n' "$RUN_ID"

section "3/15 — INDEPENDENT VERIFY-PROOF"
go run ./cmd/keystone pipeline verify-proof --run-id "$RUN_ID" --run-root "$RUN_ROOT"

section "4/15 — DETERMINISTIC REPLAY"
go run ./cmd/keystone replay --run-id "$RUN_ID" --run-root "$RUN_ROOT"

section "5/15 — ORIGINAL PROOF-ENVELOPE HASH"
sha256sum "$RUN_ROOT/$RUN_ID/proof_envelope.json"

section "6/15 — CREATE DISPOSABLE TAMPER COPY"
rm -rf "$TAMPER"
cp -a "$RUN_ROOT/$RUN_ID" "$TAMPER"

section "7/15 — PROVE COPY MATCHES ORIGINAL"
sha256sum "$TAMPER/proof_envelope.json"

section "8/15 — TAMPER ONLY final_proof"
python3 -c 'import json; p="/tmp/keystone_video_tamper/proof_envelope.json"; d=json.load(open(p)); d["final_proof"]="sha256:"+"0"*64; open(p,"w").write(json.dumps(d,separators=(",",":"))+"\n")'
printf 'Disposable copy tampered.\n'

section "9/15 — VERIFY TAMPERED COPY — EXPECT FAIL_CLOSED"
if go run ./cmd/keystone pipeline verify-proof --run-id keystone_video_tamper --run-root /tmp; then
  printf 'ERROR: tampered proof unexpectedly verified\n'
  exit 1
fi

section "10/15 — VERIFY UNTOUCHED ORIGINAL AGAIN"
go run ./cmd/keystone pipeline verify-proof --run-id "$RUN_ID" --run-root "$RUN_ROOT"

section "11/15 — FRESH PUBLIC CLONE STATUS"
cd "$PUBLIC_CLONE"
git status --short --branch

section "12/15 — PUBLIC MANIFEST + PROOF ANCHOR"
bash verify/verify-manifest.sh

section "13/15 — PUBLISHED SELF-PROOF"
cd "$ENGINE"
go run ./cmd/keystone pipeline verify-proof --run-id keystone_self_proof_e02a09f --run-root "$PUBLIC_CLONE/release_evidence"

section "14/15 — PUBLIC NEGATIVE PROOF — EXPECT FAIL_CLOSED"
if go run ./cmd/keystone pipeline verify-proof --run-id keystone-cold-negative --run-root /tmp; then
  printf 'ERROR: public negative proof unexpectedly verified\n'
  exit 1
fi

section "15/15 — UNTOUCHED PUBLISHED SCORECARD PROOF"
go run ./cmd/keystone pipeline verify-proof --run-id scorecard_proof_9ad561d838321315 --run-root "$PUBLIC_CLONE/external_proofs"

section "KEYSTONE VIDEO PROOF — COMPLETE"
printf 'SAFE evidence verified. Tampered copies rejected FAIL_CLOSED.\n'
