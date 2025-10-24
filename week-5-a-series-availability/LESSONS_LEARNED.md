# Week 5 Lessons Learned

1. Lambda requires a valid trust policy with `lambda.amazonaws.com` as the principal.
2. EventBridge must have permission to invoke the Lambda.
3. SNS topics should be created before Lambda to ensure proper ARN references.
4. Testing alarms with fake metrics is an efficient way to validate configurations.
5. Always clean up EventBridge rules and Lambda permissions to avoid residual triggers.
