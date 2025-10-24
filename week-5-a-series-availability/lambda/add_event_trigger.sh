#!/bin/bash
set -e

RULE_NAME="SecurityAlertRule"
LAMBDA_ARN=$(aws lambda get-function --function-name IncidentResponseFunction --query 'Configuration.FunctionArn' --output text)

aws events put-rule \
  --name $RULE_NAME \
  --event-pattern '{"source": ["aws.cloudwatch"]}' \
  --state ENABLED

aws lambda add-permission \
  --function-name IncidentResponseFunction \
  --statement-id AllowEventBridgeInvoke \
  --action lambda:InvokeFunction \
  --principal events.amazonaws.com \
  --source-arn arn:aws:events:us-east-1:797333189577:rule/$RULE_NAME

aws events put-targets \
  --rule $RULE_NAME \
  --targets "Id"="1","Arn"="$LAMBDA_ARN"

echo "EventBridge trigger added successfully."
