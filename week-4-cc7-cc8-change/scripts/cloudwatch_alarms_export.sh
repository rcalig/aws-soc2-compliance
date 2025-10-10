#!/bin/bash
set -e
echo "=== Exporting CloudWatch deployment alarms ==="
aws cloudwatch describe-alarms \
  --query "MetricAlarms[?contains(AlarmName, 'Deploy')]" \
  --output json > evidence/deploy-alarms.json
echo "✅ CloudWatch alarms exported to evidence/deploy-alarms.json"
