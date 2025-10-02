import csv, json, datetime, os

src = "cred.csv"
rows = list(csv.DictReader(open(src)))
non_mfa = [r for r in rows if r["user"] != "<root_account>" and r.get("mfa_active","false").lower() != "true"]

out = {
    "generated_utc": datetime.datetime.utcnow().isoformat(),
    "non_mfa_users": [{"user": r["user"], "arn": r["arn"], "password_enabled": r["password_enabled"]} for r in non_mfa]
}

with open("non_mfa.json","w") as f:
    json.dump(out, f, indent=2)

print(f"✅ Wrote non_mfa.json with {len(non_mfa)} users")

bucket = os.environ.get("EVIDENCE_BUCKET")
if bucket:
    os.system(f"aws s3 cp non_mfa.json s3://{bucket}/cc6/mfa/non_mfa-{datetime.date.today()}.json")
