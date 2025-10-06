# ✅ Week 3 Verification Checklist – Security Monitoring & Detection

Use this checklist to confirm all deliverables are complete and evidence exists in S3.  
Bucket: `s3://$EVIDENCE_BUCKET/cc6/guardduty/` and `s3://$EVIDENCE_BUCKET/cc6/monitoring/`

---

## Step 1 – Enable GuardDuty
- [ ] GuardDuty detector created
- [ ] Detector ID saved in `detector_id.txt`
- [ ] Verified detector status is ENABLED
- [ ] Evidence: `guardduty-findings.json` generated

---

## Step 2 – Enable VPC Flow Logs
- [ ] IAM role `vpc-flow-logs-role` created
- [ ] Flow logs enabled for all VPCs
- [ ] Logs visible in CloudWatch group `VPCFlowLogs`
- [ ] Evidence: CloudWatch entries visible for ACCEPT/REJECT traffic

---

## Step 3 – Export GuardDuty Findings (CLI)
- [ ] `get_findings.sh` executed successfully
- [ ] `guardduty-findings.json` created locally
- [ ] File uploaded to `cc6/guardduty/guardduty-findings-YYYY-MM-DD.json`

---

## Step 4 – Python Filtering
- [ ] `export_findings.py` executed
- [ ] `export_findings.json` created locally
- [ ] File contains summarized fields: id, type, severity, resource
- [ ] Uploaded to `cc6/guardduty/export-findings-YYYY-MM-DD.json`

---

## Step 5 – Upload Evidence
- [ ] Evidence files uploaded to S3 bucket
- [ ] Folder path: `/cc6/guardduty/`
- [ ] Files accessible and versioned (via S3 console)

---

## Step 6 – Lambda Automation
- [ ] IAM role `GuardDutyIngestLambdaRole` created with trust policy
- [ ] Permissions attached: LambdaBasicExecutionRole, GuardDutyReadOnly, S3FullAccess
- [ ] Lambda function `GuardDutyIngestor` deployed
- [ ] Environment variable `EVIDENCE_BUCKET` set
- [ ] EventBridge rule `GuardDutyFindingRule` created
- [ ] Lambda permission added to allow EventBridge invocation
- [ ] Evidence files appear automatically in `/cc6/monitoring/` when new findings occur

---

## Step 7 – Verification
- [ ] Verified Lambda test invoke returns `{"status":"ok"}` or `{"status":"no_findings"}`
- [ ] Verified EventBridge target linked to Lambda
- [ ] Verified new findings automatically uploaded to `/cc6/monitoring/`

---

✅ When all boxes are ticked, Week 3 is complete.
