# Week 4 – Change Management & Code Compliance

**Purpose**  
Automate evidence for code integrity, image scanning, and deployment monitoring.

**Controls Covered**  
- CC 7.2  – ECR container scan  
- CC 8.1.3 – Version control with RBAC (Git)  
- CC 8.1.5 – Static code scan (Semgrep)  
- CC 8.1.7 – Approved change (CodePipeline approvals)  
- CC 8.1.9 – Deploy alerts (CloudWatch alarms)

**Deliverables**
- `ecr-scan.json`  → ECR image scan evidence  
- `deploy-alarms.json` → Active deployment alarms  
- `semgrep-results.json`  → Static code analysis report  
- Lambda integration (optional) to upload GitLab scan artifacts to S3

Evidence path: `s3://$EVIDENCE_BUCKET/cc7/scans/`
