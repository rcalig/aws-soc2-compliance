# ✅ Week 4 Verification Checklist – Change & Code Compliance

## Step 1 – Container Image Scanning (ECR)
- [ ] `ecr_scan_export.sh` executed successfully  
- [ ] Evidence `ecr-scan.json` exists in `/cc7/scans/`  

## Step 2 – Deployment Alerts (CloudWatch)
- [ ] `cloudwatch_alarms_export.sh` executed successfully  
- [ ] Evidence `deploy-alarms.json` uploaded to `/cc7/scans/`  

## Step 3 – Static Code Scan (GitLab Semgrep)
- [ ] `semgrep-results.json` generated from GitLab CI  
- [ ] Evidence uploaded to S3 via `gitlab_artifact_upload.py`  

## Step 4 – Version Control RBAC (Git)
- [ ] GitLab project members reviewed for RBAC mapping  
- [ ] Screenshot or JSON evidence stored in `/cc7/scans/git-rbac/`

✅ When all boxes are checked, Week 4 is complete.
