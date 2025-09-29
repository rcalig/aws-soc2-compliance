# Week 3: Security Monitoring

## Controls Covered
- CC 6.6.2 Security monitoring active (GuardDuty).
- CC 6.6.3 IDS/IPS (GuardDuty + VPC.1).
- CC 6.6.4 Log aggregation (CloudTrail.2 / CloudWatch.5) – already enabled.

## Learning Objectives
- **CLI**: Enable GuardDuty detector, list findings, enable VPC Flow Logs.
- **Python**: Export GuardDuty findings and filter by severity.
- **Lambda**: Auto-ingest GuardDuty findings into S3.

## Evidence Produced
- `guardduty-findings.json` uploaded to `/cc6/guardduty/`.
- `export_findings.py` outputs simplified JSON (`id, type, severity`).
- Lambda ingestion function storing new GuardDuty findings in `/cc6/monitoring/`.
