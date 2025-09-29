set -e
export AWS_REGION=ap-southeast-2
export AWS_PROFILE=grc-sandbox
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

KEY_ID=$(aws kms create-key --description "GRC Evidence Key" --query KeyMetadata.KeyId --output text)
aws kms create-alias --alias-name alias/grc-evidence --target-key-id "$KEY_ID"

echo '{
  "Rules": [
    {
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "aws:kms",
        "KMSMasterKeyID": "'"$KEY_ID"'"
      },
      "BucketKeyEnabled": true
    }
  ]
}' > bucket-encryption.json

aws s3api put-bucket-encryption \
  --bucket "$1" \
  --server-side-encryption-configuration file://bucket-encryption.json

echo "KMS key created: $KEY_ID and bucket encryption enabled"
