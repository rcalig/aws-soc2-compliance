#!/bin/bash
set -e

aws sns list-topics > sns-topic-details.json
aws cloudwatch describe-alarms > incident-alerts.json

echo "Evidence exported: sns-topic-details.json and incident-alerts.json"
