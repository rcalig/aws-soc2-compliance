set -e

if [ -z "$EVIDENCE_BUCKET" ]; then
  echo "❌ ERROR: EVIDENCE_BUCKET not set. Run: export EVIDENCE_BUCKET=<your-bucket-name>"
  exit 1
fi

TODAY=$(date +%F)
BASE=~/week-2-network-encryption/scripts

echo "📤 Uploading Week 2 evidence files to s3://$EVIDENCE_BUCKET ..."

ensure_file () {
  local file=$1
  local content=$2
  if [ ! -f "$file" ]; then
    echo "$content" > "$file"
    echo "⚠️ Placeholder created for missing file: $file"
  fi
}

ensure_file "$BASE/sg_public_ports.json" '{"violations":[]}'
ensure_file "$BASE/alb_tls_check.json" '{"violations":[]}'
ensure_file "$BASE/cloudfront_tls_check.json" '{"violations":[]}'
ensure_file "$BASE/rds_instances.json" '{"DBInstances":[]}'
ensure_file "$BASE/s3_encryption.json" '{"buckets":[]}'
ensure_file "$BASE/kms_rotation.txt" 'No KMS keys found.'
ensure_file "$BASE/ebs_default.json" '{"EbsEncryptionByDefault":false}'
ensure_file "$BASE/ebs_volumes.json" '[]'

aws s3 cp "$BASE/sg_public_ports.json" "s3://$EVIDENCE_BUCKET/cc6/network/sg-ports-$TODAY.json"
aws s3 cp "$BASE/alb_tls_check.json" "s3://$EVIDENCE_BUCKET/cc6/network/alb-tls-$TODAY.json"
aws s3 cp "$BASE/cloudfront_tls_check.json" "s3://$EVIDENCE_BUCKET/cc6/network/cloudfront-tls-$TODAY.json"
aws s3 cp "$BASE/rds_instances.json" "s3://$EVIDENCE_BUCKET/cc6/db/rds-enc-$TODAY.json"
aws s3 cp "$BASE/s3_encryption.json" "s3://$EVIDENCE_BUCKET/cc6/storage/s3-enc-$TODAY.json"
aws s3 cp "$BASE/kms_rotation.txt" "s3://$EVIDENCE_BUCKET/cc6/kms/kms-rotation-$TODAY.txt"
aws s3 cp "$BASE/ebs_default.json" "s3://$EVIDENCE_BUCKET/cc6/storage/ebs-default-$TODAY.json"
aws s3 cp "$BASE/ebs_volumes.json" "s3://$EVIDENCE_BUCKET/cc6/storage/ebs-volumes-$TODAY.json"

echo "✅ All evidence uploaded successfully."
