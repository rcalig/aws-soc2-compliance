# Week 3 – Lessons Learned

## What Worked Well
- Automating GuardDuty findings was straightforward once IAM permissions were correct.
- Using EventBridge triggers removed the need for manual evidence exports.
- VPC Flow Logs integration with CloudWatch provided valuable network visibility.
- The modular folder structure (scripts, lambda, docs) made updates easy.

## Common Errors and Fixes
- **Error:** “No such file or directory” for trust policy JSON.  
  **Fix:** Ensure `lambda/lambda-trust-policy.json` is created before running `aws iam create-role`.

- **Error:** “The role cannot be assumed by Lambda.”  
  **Fix:** Confirm trust policy includes `"Service": "lambda.amazonaws.com"`.

- **Error:** Lambda fails to upload findings.  
  **Fix:** Check `EVIDENCE_BUCKET` environment variable and S3 permissions.

- **Error:** EventBridge doesn’t trigger Lambda.  
  **Fix:** Verify EventBridge rule’s target and ensure Lambda permission is added via `add-permission`.

## Key Takeaways
- Always enable GuardDuty first; Lambda relies on its events.
- EventBridge is the simplest way to automate evidence collection for SOC 2 monitoring controls.
- Using separate folders for GuardDuty (`cc6/guardduty`) and monitoring (`cc6/monitoring`) simplifies audits.
- Testing Lambda manually with `aws lambda invoke` is a fast way to confirm role and environment setup.
- All evidence is now automated for CC 6.6.2, CC 6.6.3, and CC 6.6.4.

## Next Steps
- Extend Lambda to include SNS notifications for high-severity findings.
- Correlate GuardDuty events with VPC Flow Logs for deeper threat analysis.
- Add daily summary reports to `/cc6/reports/`.
