import csv, json, datetime, os

rows = list(csv.DictReader(open("cred.csv")))
root = [r for r in rows if r["user"] == "<root_account>"]

out = {"generated_utc": datetime.datetime.utcnow().isoformat()}
if root:
    r = root[0]
    out["root_mfa_active"] = r.get("mfa_active")
    out["root_access_key_1_active"] = r.get("access_key_1_active")
    out["root_access_key_2_active"] = r.get("access_key_2_active")

with open("root_status.json","w") as f:
    json.dump(out, f, indent=2)

print("✅ Root account status written to root_status.json")

bucket = os.environ.get("EVIDENCE_BUCKET")
if bucket:
    os.system(f"aws s3 cp root_status.json s3://{bucket}/cc6/root/root-status-{datetime.date.today()}.json")
