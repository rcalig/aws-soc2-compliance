cat > lambda/guardduty_ingest.py <<'EOF'
import boto3, json, datetime, os

s3 = boto3.client("s3")

def lambda_handler(event, context):
    bucket = os.environ["EVIDENCE_BUCKET"]
    now = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H-%M-%SZ")
    uploaded = 0

    # GuardDuty event payload structure
    findings = event.get("detail", {}).get("findings", [])
    if not findings:
        print("No findings in event. Nothing to upload.")
        return {"status": "no_findings"}

    for finding in findings:
        finding_id = finding.get("Id", "unknown")
        fname = f"guardduty-finding-{finding_id}-{now}.json"
        body = json.dumps(finding, indent=2)
        s3.put_object(Bucket=bucket, Key=f"cc6/monitoring/{fname}", Body=body)
        uploaded += 1

    print(f"Uploaded {uploaded} findings to s3://{bucket}/cc6/monitoring/")
    return {"status": "ok", "uploaded": uploaded}
EOF
