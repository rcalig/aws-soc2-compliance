# Save as upload_buckets.py
import boto3, json, datetime

s3 = boto3.client("s3")
client = boto3.client("s3")
timestamp = datetime.datetime.utcnow().strftime("%Y-%m-%d")

# List all buckets
buckets = client.list_buckets()

# Save evidence
filename = f"buckets-{timestamp}.json"
with open(filename, "w") as f:
    json.dump(buckets, f, indent=2)

# Upload to /bootstrap/ folder
bucket_name = "grc-evidence-<accountid>-<timestamp>"  # replace
s3.upload_file(filename, bucket_name, f"bootstrap/{filename}")

print(f"✅ Evidence uploaded to s3://{bucket_name}/bootstrap/{filename}")
