# Week 1: Access Controls (CC6 – IAM)

## Controls Covered
- CC 6.1.2 MFA enforced (IAM.5 / IAM.6).
- CC 6.1.3 Strong password policy (IAM.1 / IAM.2).
- CC 6.1.9 RBAC via groups (IAM.3).
- CC 6.2.1 Admin access limited (IAM.4).

## Learning Objectives
- **CLI**: Generate IAM credential report, export password policy, list users and groups.
- **Python**: Parse credential report to flag non-MFA users.
- **Lambda**: Automate daily credential report upload to S3.

## Evidence Produced
- `cred.csv` and `password-policy.json` uploaded to `/cc6/mfa/` and `/cc6/password/`.
- `parse_cred_report.py` script to convert CSV into JSON compliance evidence.
- `lambda_function.py` scheduled via EventBridge to push daily reports.
