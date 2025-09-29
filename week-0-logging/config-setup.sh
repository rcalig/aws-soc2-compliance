set -e
export AWS_REGION=ap-southeast-2
export AWS_PROFILE=grc-sandbox
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

CONFIG_BUCKET="grc-config-${ACCOUNT_ID}-$(date +%Y%m%d%H%M%S)"

aws s3api create-bucket \
  --bucket "$CONFIG_BUCKET" \
  --region "$AWS_REGION" \
  --create-bucket-configuration LocationConstraint="$AWS_REGION"

aws s3api put-bucket-policy --bucket "$CONFIG_BUCKET" --policy file://config-bucket-policy.json

aws s3api put-bucket-encryption \
  --bucket "$CONFIG_BUCKET" \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

aws iam create-service-linked-role --aws-service-name config.amazonaws.com || true

CONFIG_ROLE_ARN="arn:aws:iam::$ACCOUNT_ID:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"

aws configservice put-configuration-recorder \
  --configuration-recorder "name=default,roleARN=$CONFIG_ROLE_ARN,recordingGroup={allSupported=true,includeGlobalResourceTypes=true}"

aws configservice put-delivery-channel \
  --delivery-channel "name=default,s3BucketName=$CONFIG_BUCKET,s3KeyPrefix=AWSLogs/$ACCOUNT_ID/Config"

aws configservice start-configuration-recorder --configuration-recorder-name default

echo "AWS Config enabled. Snapshots will appear in $CONFIG_BUCKET"
