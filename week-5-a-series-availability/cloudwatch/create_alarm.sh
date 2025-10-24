#!/bin/bash
set -e

ALARM_NAME="HighCPUAlarm"

aws cloudwatch put-metric-alarm \
  --alarm-name $ALARM_NAME \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 60 \
  --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --evaluation-periods 1 \
  --alarm-actions arn:aws:sns:us-east-1:797333189577:IncidentAlerts \
  --dimensions Name=InstanceId,Value=i-1234567890abcdef0

echo "CloudWatch alarm created successfully."
