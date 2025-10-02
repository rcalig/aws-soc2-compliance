set -e
# List all entities with AdministratorAccess

ADMIN_ARN=$(aws iam list-policies --scope AWS --query "Policies[?PolicyName=='AdministratorAccess'].Arn" --output text)

aws iam list-entities-for-policy --policy-arn "$ADMIN_ARN" > admin-entities.json
aws s3 cp admin-entities.json "s3://$EVIDENCE_BUCKET/cc6/admin/admin-entities-$(date +%F).json"

echo "✅ Admin access entities captured"
