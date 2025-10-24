#!/bin/bash
set -e

ROLE_NAME="IncidentResponseRole"

aws iam create-role \
  --role-name $ROLE_NAME \
  --assume-role-policy-document file://lambda/incident-trust-policy.json

aws iam put-role-policy \
  --role-name $ROLE_NAME \
  --policy-name IncidentResponsePolicy \
  --policy-document file://lambda/incident-role-policy.json

echo "Lambda IAM role created successfully."
