set -e
# Enable IAM-related AWS Config rules

aws configservice put-config-rule --config-rule '{
  "ConfigRuleName":"iam-user-mfa-enabled",
  "Source":{"Owner":"AWS","SourceIdentifier":"IAM_USER_MFA_ENABLED"}
}'

aws configservice put-config-rule --config-rule '{
  "ConfigRuleName":"iam-password-policy",
  "Source":{"Owner":"AWS","SourceIdentifier":"IAM_PASSWORD_POLICY"}
}'

aws configservice put-config-rule --config-rule '{
  "ConfigRuleName":"iam-user-group-membership-check",
  "Source":{"Owner":"AWS","SourceIdentifier":"IAM_USER_GROUP_MEMBERSHIP_CHECK"}
}'

aws configservice put-config-rule --config-rule '{
  "ConfigRuleName":"root-account-mfa-enabled",
  "Source":{"Owner":"AWS","SourceIdentifier":"ROOT_ACCOUNT_MFA_ENABLED"}
}'

echo "✅ Config rules enabled"
