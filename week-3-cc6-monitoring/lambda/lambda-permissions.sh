aws iam attach-role-policy \
  --role-name GuardDutyIngestLambdaRole \
  --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

aws iam attach-role-policy \
  --role-name GuardDutyIngestLambdaRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonGuardDutyReadOnlyAccess

aws iam attach-role-policy \
  --role-name GuardDutyIngestLambdaRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
