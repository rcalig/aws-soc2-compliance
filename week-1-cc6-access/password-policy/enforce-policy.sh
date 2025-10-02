set -e
# Enforce strong password policy

aws iam update-account-password-policy \
  --minimum-password-length 14 \
  --require-symbols \
  --require-numbers \
  --require-lowercase-characters \
  --require-uppercase-characters \
  --max-password-age 90 \
  --password-reuse-prevention 24

aws iam get-account-password-policy > password-policy-after.json
aws s3 cp password-policy-after.json "s3://$EVIDENCE_BUCKET/cc6/password/password-policy-after-$(date +%F).json"

echo "✅ Strong password policy enforced"
