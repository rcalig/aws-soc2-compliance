# ✅ Week 1 Verification Checklist – Access Controls

Use this checklist to confirm all deliverables are complete and evidence exists in S3.  
Bucket: `s3://$EVIDENCE_BUCKET/cc6/...`

---

## Step 1 – Config Rules
- [ ] MFA rule created (`iam-user-mfa-enabled`)
- [ ] Password policy rule created (`iam-password-policy`)
- [ ] RBAC rule created (`iam-user-group-membership-check`)
- [ ] Root MFA rule created (`root-account-mfa-enabled`)
- [ ] Evidence: compliance events in `cc6/logs/`

---

## Step 2 – Credential Report
- [ ] `cred.csv` generated locally
- [ ] `cred-YYYY-MM-DD.csv` uploaded to `cc6/mfa/`

---

## Step 3 – Non-MFA Users
- [ ] `non_mfa.json` generated locally
- [ ] `non_mfa-YYYY-MM-DD.json` uploaded to `cc6/mfa/`
- [ ] File shows **zero non-MFA users** after enforcement

---

## Step 4 – Root Account Evidence
- [ ] `root_status.json` generated
- [ ] `root-status-YYYY-MM-DD.json` uploaded to `cc6/root/`
- [ ] File shows `"mfa_active": true` and no active root access keys

---

## Step 5 – Password Policy
- [ ] `password-policy-before-YYYY-MM-DD.json` uploaded to `cc6/password/`
- [ ] Strong password policy applied (14+ chars, complexity, 90-day expiry)
- [ ] `password-policy-after-YYYY-MM-DD.json` uploaded to `cc6/password/`

---

## Step 6 – RBAC Mapping
- [ ] `rbac_mapping.json` generated locally
- [ ] `rbac-YYYY-MM-DD.json` uploaded to `cc6/rbac/`
- [ ] All IAM users appear with at least one group membership

---

## Step 7 – Admin Access
- [ ] `admin-entities.json` generated
- [ ] `admin-entities-YYYY-MM-DD.json` uploaded to `cc6/admin/`
- [ ] File shows only limited roles (no unnecessary users/groups with AdminAccess)

---

## Step 8 – Automation (Optional)
- [ ] Lambda `iam-daily-report` created
- [ ] Daily EventBridge rule created
- [ ] Files auto-appear in `cc6/mfa/` each day (`cred-YYYY-MM-DD.csv`, `non_mfa-YYYY-MM-DD.json`)

---

✅ When all boxes are ticked, Week 1 is complete.
