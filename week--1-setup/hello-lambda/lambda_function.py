import json, os, boto3, datetime

s3 = boto3.client("s3")
BUCKET = os.environ["EVIDENCE_BUCKET"]

def lambda_function(event, context):
    ts = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H-%M-%SZ")
    doc = {"ok": True, "ts": ts, "event": event}
    s3.put_object(
        Bucket=BUCKET,
        Key=f"bootstrap/hello-{ts}.json",
        Body=json.dumps(doc).encode()
    )
    return doc
