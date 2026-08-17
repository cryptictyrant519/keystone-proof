import base64
import hashlib
import json
import sys
from pathlib import Path

tool_root = Path("/home/swaa1/SmartStruct_Rebuild").resolve()
stage_root = Path(__file__).resolve().parent
input_path = stage_root / "smartstruct_input.json"
out_path = stage_root / "smartstruct_result.json"

sys.path.insert(0, str(tool_root))
sys.path.insert(0, str(tool_root / "backend"))

from backend.services.packager import build_zip

def canonical_bytes(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode("utf-8")

payload = json.loads(input_path.read_text(encoding="utf-8"))

request = payload["request"]
result = build_zip(
    code=request["code"],
    project_name=request["project_name"],
    features={"scaffold": False},
)

zip_sha256 = hashlib.sha256(result.zip_bytes).hexdigest()

body = {
    "ok": True,
    "schema_version": "keystone.smartstruct.adapter.result.v1",
    "stage_id": "02_smartstruct",
    "compat": payload["compat"],
    "lineage": {
        "input_sha256": hashlib.sha256(canonical_bytes(payload)).hexdigest(),
        "job_id": result.job_id,
    },
    "produced_artifacts": [
        {
            "name": result.filename,
            "sha256": "sha256:" + zip_sha256,
            "media_type": "application/zip",
            "bytes": len(result.zip_bytes),
        }
    ],
    "primary_artifact": {
        "name": result.filename,
        "sha256": "sha256:" + zip_sha256,
        "media_type": "application/zip",
        "base64": base64.b64encode(result.zip_bytes).decode("ascii"),
    },
    "receipt": {
        "job_id": result.job_id,
        "language": result.meta.get("language", "unknown"),
        "features": result.meta.get("features", {}),
    },
}

out_path.write_bytes(canonical_bytes(body) + b"\n")
