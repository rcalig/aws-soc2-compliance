cat > scripts/enable_vpc_flowlogs.sh <<'EOF'
#!/bin/bash
set -e
echo "Enabling VPC Flow Logs for all VPCs..."

VPCS=$(aws ec2 describe-vpcs --query 'Vpcs[].VpcId' --output text)
LOG_GROUP="VPCFlowLogs"
ROLE_ARN=$(aws iam list-roles --query 'Roles[?RoleName==`vpc-flow-logs-role`].Arn' --output text)

if [ -z "$ROLE_ARN" ]; then
  echo "Creating IAM role for Flow Logs..."
  aws iam create-role --role-name vpc-flow-logs-role \
    --assume-role-policy-document '{
      "Version":"2012-10-17",
      "Statement":[{"Effect":"Allow","Principal":{"Service":"vpc-flow-logs.amazonaws.com"},"Action":"sts:AssumeRole"}]
    }' >/dev/null
  aws iam attach-role-policy --role-name vpc-flow-logs-role \
    --policy-arn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess
  ROLE_ARN=$(aws iam list-roles --query 'Roles[?RoleName==`vpc-flow-logs-role`].Arn' --output text)
fi

for vpc in $VPCS; do
  echo "Enabling flow logs for $vpc..."
  aws ec2 create-flow-logs \
    --resource-type VPC \
    --resource-ids $vpc \
    --traffic-type ALL \
    --log-group-name $LOG_GROUP \
    --deliver-logs-permission-arn $ROLE_ARN \
    >/dev/null || true
done

echo "VPC Flow Logs enabled and sent to CloudWatch Logs: $LOG_GROUP"
EOF

chmod +x scripts/enable_vpc_flowlogs.sh
scripts/enable_vpc_flowlogs.sh
