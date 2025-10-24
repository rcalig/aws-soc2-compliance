#!/bin/bash
set -e

SNS_TOPIC_NAME="IncidentAlerts"

aws sns create-topic --name $SNS_TOPIC_NAME > sns-topic-details.json
echo "SNS topic created and details saved to sns-topic-details.json"
