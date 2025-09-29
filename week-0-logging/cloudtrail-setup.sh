set -e
export AWS_REGION=ap-southeast-2
export AWS_PROFILE=grc-sandbox
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

TRAIL_BUCKET="grc-cloudtrail-${ACCOUNT_ID}-$(date +%Y%m%d%H%M%S)"
TRAIL_NAME=grc-account-trail

aws s3api create-bucket \
  --bucket "$TRAIL_BUCKET" \
  --region "$AWS_REGION" \
  --create-bucket-configuration LocationConstraint="$AWS_REGION"

aws s3api put-bucket-policy --bucket "$TRAIL_BUCKET" --policy file://ct-bucket-policy.json

aws s3api put-bucket-encryption \
  --bucket "$TRAIL_BUCKET" \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

aws cloudtrail create-trail --name "$TRAIL_NAME" --s3-bucket-name "$TRAIL_BUCKET" --is-multi-region-trail
aws cloudtrail start-logging --name "$TRAIL_NAME"

echo "CloudTrail enabled. Logs will appear in $TRAIL_BUCKET"
