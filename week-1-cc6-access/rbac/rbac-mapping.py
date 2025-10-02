import boto3, json, datetime, os

iam = boto3.client("iam")
users = iam.list_users()["Users"]

mapping = []
for u in users:
    gs = iam.list_groups_for_user(UserName=u["UserName"])["Groups"]
    mapping.append({"user": u["UserName"], "groups": [g["GroupName"] for g in gs]})

out = {
    "generated_utc": datetime.datetime.utcnow().isoformat(),
    "users": mapping
}

with open("rbac_mapping.json","w") as f:
    json.dump(out, f, indent=2)

print("✅ RBAC mapping written to rbac_mapping.json")

bucket = os.environ.get("EVIDENCE_BUCKET")
if bucket:
    os.system(f"aws s3 cp rbac_mapping.json s3://{bucket}/cc6/rbac/rbac-{datetime.date.today()}.json")
