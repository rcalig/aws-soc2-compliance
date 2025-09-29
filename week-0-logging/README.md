# Week 0: Baseline Logging

## Purpose
- Enable CloudTrail and AWS Config to log all account activity.
- Store CloudTrail logs in a dedicated bucket with encryption.
- Store Config snapshots/history in a separate bucket.
- Forward Config compliance change events into the evidence bucket via Lambda.

## Controls Covered
- CC 6.6.4: Log aggregation (CloudTrail + Config)
- Foundation for CC 6.6.2 and CC 6.6.3 (monitoring, IDS/IPS)

## Deliverables
- CloudTrail bucket with bucket policy.
- Config bucket with bucket policy.
- Active multi-region CloudTrail.
- Active AWS Config recorder + delivery channel.
- Lambda function that writes Config events to evidence bucket.
- Evidence:  
  - `/cc6/logs/config-event-*.json`
  - CloudTrail logs under `s3://TRAIL_BUCKET/AWSLogs/ACCOUNT_ID/`
  - Config history under `s3://CONFIG_BUCKET/AWSLogs/ACCOUNT_ID/Config/`
