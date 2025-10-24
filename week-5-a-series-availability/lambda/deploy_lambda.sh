#!/bin/bash
set -e

ZIP_FILE="incident_response.zip"
FUNCTION_NAME="IncidentResponseFunction"
ROLE_ARN=$(aws iam get-role --role-name IncidentResponseRole --query 'Role.Arn' --output text)
SNS_TOPIC_ARN=$(jq -r '.TopicArn' sns-topic-details.json)

zip -j $ZIP_FILE lambda/incident_response.py

aws lambda create-function \
  --function-name $FUNCTION_NAME \
  --runtime python3.9 \
  --role $ROLE_ARN \
  --handler incident_response.lambda_handler \
  --zip-file fileb://$ZIP_FILE \
  --environment Variables="{SNS_TOPIC_ARN=$SNS_TOPIC_ARN}"

echo "Lambda function deployed successfully."
