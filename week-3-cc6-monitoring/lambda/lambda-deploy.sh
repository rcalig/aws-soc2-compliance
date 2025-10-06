cd lambda
zip function.zip guardduty_ingest.py
ROLE_ARN=$(aws iam get-role --role-name GuardDutyIngestLambdaRole --query 'Role.Arn' --output text)

aws lambda create-function \
  --function-name GuardDutyIngestor \
  --runtime python3.9 \
  --role "$ROLE_ARN" \
  --handler guardduty_ingest.lambda_handler \
  --zip-file fileb://function.zip \
  --environment Variables="{EVIDENCE_BUCKET=$EVIDENCE_BUCKET}"
