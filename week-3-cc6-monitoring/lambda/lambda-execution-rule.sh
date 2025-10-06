aws iam create-role \
  --role-name GuardDutyIngestLambdaRole \
  --assume-role-policy-document file://lambda/lambda-trust-policy.json
