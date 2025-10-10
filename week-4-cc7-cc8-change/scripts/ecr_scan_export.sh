#!/bin/bash
set -e
echo "=== Exporting ECR scan findings to ecr-scan.json ==="
aws ecr describe-image-scan-findings \
  --repository-name my-ecr-repo \
  --image-id imageTag=latest \
  --output json > evidence/ecr-scan.json
echo "✅ ECR scan evidence saved to evidence/ecr-scan.json"
