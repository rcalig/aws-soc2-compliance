set -e
# Export current password policy

aws iam get-account-password-policy > password-policy-before.json || echo '{}' > password-policy-before.json
aws s3 cp password-policy-before.json "s3://$EVIDENCE_BUCKET/cc6/password/password-policy-before-$(date +%F).json"

echo "✅ Password policy exported (before)"
