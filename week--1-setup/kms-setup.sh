  # Variables
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BUCKET="grc-evidence-$ACCOUNT_ID-$TIMESTAMP"

# Create bucket (replace region if not ap-southeast-2)
aws s3api create-bucket \
  --bucket $BUCKET \
  --region ap-southeast-2 \
  --create-bucket-configuration LocationConstraint=ap-southeast-2

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket $BUCKET \
  --versioning-configuration Status=Enabled

# Create a KMS CMK and alias
KEY_ID=$(aws kms create-key --query KeyMetadata.KeyId --output text)
aws kms create-alias --alias-name alias/grc-evidence --target-key-id $KEY_ID

# Enable default encryption with KMS
aws s3api put-bucket-encryption \
  --bucket $BUCKET \
  --server-side-encryption-configuration '{
    "Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"aws:kms","KMSMasterKeyID":"'$KEY_ID'"}}]
  }'

echo "✅ Evidence bucket $BUCKET created with KMS alias/grc-evidence"
