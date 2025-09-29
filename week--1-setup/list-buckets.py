import json, boto3, datetime

s3 = boto3.client("s3")
resp = s3.list_buckets()

out = {
    "timestamp_utc": datetime.datetime.utcnow().isoformat(),
    "buckets": [b["Name"] for b in resp.get("Buckets", [])]
}

with open("buckets.json", "w") as f:
    f.write(json.dumps(out, indent=2))

print(json.dumps(out, indent=2))
