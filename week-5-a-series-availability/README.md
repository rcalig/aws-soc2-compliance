# Week 5: Availability & Backups

## Controls Covered
- CC 9.1.3 Cross-AZ backups (rds-automatic-backup-enabled).
- A 1.1.1 Capacity monitoring (EC2.8 + CloudWatch alarms).
- A 1.1.2 Auto-scaling (autoscaling-group-elb-healthcheck-required).
- A 1.2.1 Backup failure alerts (Backup.1).
- A 1.2.3 Multi-AZ architecture (rds-multi-az-support).

## Learning Objectives
- **CLI**: Check RDS backups, EC2 alarms, autoscaling group health, backup jobs.
- **Python**: Parse backup job list → success/failure counts.
- **Lambda**: Run weekly restore drill → save results in S3.

## Evidence Produced
- `rds-backups.json`, `ec2-alarms.json`, `autoscaling.json`, `backup-jobs.json`.
- `parse_backup_jobs.py` generates compliance summary.
- Lambda restore drill logs in `/a/backups/restore-<date>.json`.
