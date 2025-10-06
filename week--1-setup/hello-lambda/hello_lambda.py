cat > hello_lambda.py <<'EOF'
import boto3, datetime, json

def lambda_handler(event, context):
    s3 = boto3.client("s3")
    bucket_name = "grc-evidence-<accountid>-<timestamp>"  # replace
    now = datetime.datetime.utcnow().isoformat()
    filename = f"hello-{now}.json"
    content = {"hello": "world", "time": now}
    s3.put_object(Bucket=bucket_name, Key=f"bootstrap/{filename}", Body=json.dumps(content))
    return {"status": "ok", "file": filename}
EOF

zip function.zip hello_lambda.py

aws lambda create-function \
  --function-name HelloEvidence \
  --runtime python3.9 \
  --role arn:aws:iam::<accountid>:role/EvidenceLambdaRole \
  --handler hello_lambda.lambda_handler \
  --zip-file fileb://function.zip
