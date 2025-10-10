import boto3, os, datetime, json

def upload_to_s3(file_path, bucket):
    s3 = boto3.client("s3")
    timestamp = datetime.datetime.utcnow().isoformat()
    key = f"cc7/scans/{os.path.basename(file_path).replace('.json', f'-{timestamp}.json')}"
    s3.upload_file(file_path, bucket, key)
    print(f"✅ Uploaded {file_path} to s3://{bucket}/{key}")

def main():
    bucket = os.getenv("EVIDENCE_BUCKET")
    files = [
        "semgrep-results.json",
        "evidence/ecr-scan.json",
        "evidence/deploy-alarms.json",
    ]
    for f in files:
        if os.path.exists(f):
            upload_to_s3(f, bucket)
        else:
            print(f"⚠️ Skipping missing file: {f}")

if __name__ == "__main__":
    main()
