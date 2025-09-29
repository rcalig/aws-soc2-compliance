# Week 4: Change Management & Code

## Controls Covered
- CC 7.2 Network Scan (Git → ASFF).
- CC 7.2 DAST (Git → ASFF).
- CC 7.2 Container scans (ECR.1).
- CC 8.1.3 Version control RBAC (Git evidence).
- CC 8.1.5 Static code scan (Git → ASFF).
- CC 8.1.7 Approved change (CodePipeline approvals).
- CC 8.1.9 Deploy alerts (CloudWatch.14).

## Learning Objectives
- **CLI**: Confirm ECR repository scan settings, export CloudWatch alarms.
- **Python**: Store GitLab CI scan reports into S3.
- **Lambda**: Pull GitLab scan artifacts on schedule and upload to S3.

## Evidence Produced
- `ecr-scan.json`, `deploy-alarms.json`.
- Example scan artifacts: `semgrep-results.json`.
- GitLab CI job (`gitlab-ci.yml`) integrated with AWS CLI to upload artifacts.
- Lambda ingestion for CI scan results in `/cc7/scans/`.
