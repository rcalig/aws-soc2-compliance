# Week 0: Baseline Logging

## Controls Covered
- CC 6.6.4 Log aggregation (CloudTrail.2 / CloudWatch.5).

## Learning Objectives
- **CLI**: Enable CloudTrail and AWS Config.
- **Python**: Fetch recent CloudTrail events with boto3.
- **Lambda**: EventBridge → Lambda → S3 pipeline for Config non-compliance.

## Evidence Produced
- CloudTrail and Config enabled in account.
- `cloudtrail-setup.sh` and `config-setup.sh` (CLI setup scripts).
- `lambda_function.py` writing Config/CloudTrail events to S3.
- Example evidence files in S3 under `/cc6/logs/`.
