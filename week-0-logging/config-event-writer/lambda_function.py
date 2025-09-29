import json, os, boto3, datetime

s3 = boto3.client("s3")
BUCKET = os.environ["EVIDENCE_BUCKET"]
PREFIX = os.environ.get("EVIDENCE_PREFIX","cc6/logs")

def lambda_handler(event, context):
    ts = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H-%M-%SZ")
    key = f"{PREFIX}/config-event-{ts}.json"
    s3.put_object(
        Bucket=BUCKET,
        Key=key,
        Body=json.dumps(event).encode()
    )
    return {"ok": True, "key": key}
