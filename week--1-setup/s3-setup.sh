set -e
export AWS_REGION=ap-southeast-2
export AWS_PROFILE=grc-sandbox
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

SUFFIX=$(date +%Y%m%d%H%M%S)
EVIDENCE_BUCKET="grc-evidence-${ACCOUNT_ID}-${SUFFIX}"

aws s3api create-bucket \
  --bucket "$EVIDENCE_BUCKET" \
  --region "$AWS_REGION" \
  --create-bucket-configuration LocationConstraint="$AWS_REGION"

aws s3api put-bucket-versioning \
  --bucket "$EVIDENCE_BUCKET" \
  --versioning-configuration Status=Enabled

aws s3api put-public-access-block \
  --bucket "$EVIDENCE_BUCKET" \
  --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

echo "Evidence bucket created: $EVIDENCE_BUCKET"
