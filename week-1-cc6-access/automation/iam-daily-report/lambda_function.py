import boto3, csv, json, os, datetime, base64

s3 = boto3.client("s3")
iam = boto3.client("iam")
BUCKET = os.environ["EVIDENCE_BUCKET"]

def lambda_handler(event, context):
    # Generate credential report
    iam.generate_credential_report()
    rpt = iam.get_credential_report()["Content"]
    content = base64.b64decode(rpt).decode()
    ts = datetime.datetime.utcnow().strftime("%Y-%m-%d")
    s3.put_object(Bucket=BUCKET, Key=f"cc6/mfa/cred-{ts}.csv", Body=content.encode())

    # Parse non-MFA users
    rows = list(csv.DictReader(content.splitlines()))
    non_mfa = [r for r in rows if r["user"] != "<root_account>" and r.get("mfa_active","false").lower() != "true"]
    out = {
        "generated_utc": datetime.datetime.utcnow().isoformat(),
        "non_mfa_users": [{"user": r["user"], "arn": r["arn"], "password_enabled": r["password_enabled"]} for r in non_mfa]
    }
    s3.put_object(Bucket=BUCKET, Key=f"cc6/mfa/non_mfa-{ts}.json", Body=json.dumps(out).encode())
    return {"ok": True, "non_mfa_count": len(non_mfa)}
