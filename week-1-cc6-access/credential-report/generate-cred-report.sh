set -e
# Generate and upload IAM credential report

aws iam generate-credential-report
aws iam get-credential-report --query 'Content' --output text | base64 --decode > cred.csv

aws s3 cp cred.csv "s3://$EVIDENCE_BUCKET/cc6/mfa/cred-$(date +%F).csv"

echo "✅ Credential report generated and uploaded"
