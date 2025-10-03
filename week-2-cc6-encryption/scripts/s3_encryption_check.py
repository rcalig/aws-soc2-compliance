import boto3, json, datetime

s3 = boto3.client("s3")
out = []

for b in s3.list_buckets()["Buckets"]:
    name = b["Name"]
    try:
        enc = s3.get_bucket_encryption(Bucket=name)
        alg = enc["ServerSideEncryptionConfiguration"]["Rules"][0]["ApplyServerSideEncryptionByDefault"]["SSEAlgorithm"]
        out.append({"bucket":name,"default_encryption":alg})
    except Exception:
        out.append({"bucket":name,"default_encryption":"NONE"})

res = {"generated_utc": datetime.datetime.utcnow().isoformat(), "buckets": out}

with open("s3_encryption.json","w") as f:
    json.dump(res,f,indent=2)

print(f"✅ S3 encryption check complete. Checked {len(out)} buckets. File s3_encryption.json created.")
