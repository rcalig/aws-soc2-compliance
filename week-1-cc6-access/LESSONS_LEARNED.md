# Lessons Learned – Week 1 (Access Controls)

## What Worked Well
- Config rules created successfully after fixing the recorder and delivery channel from Week 0.  
- Credential report and parsing scripts generated clear JSON evidence (non-MFA users, root account status).  
- Strong password policy applied and captured in before/after JSON files.  
- RBAC export worked, showing user-to-group mappings.  
- Admin entities script identified roles with AdministratorAccess, providing visibility into privileged access.  

## Challenges Faced
- Initial errors with Config recorder setup (role ARN, delivery channel policy).  
- Needed boto3 installed before Python scripts would run.  
- Root account check required relying on credential report parsing rather than Config rule.  
- Uploads to S3 failed if evidence file generation failed earlier (needed to re-run scripts after fixing).  

## Key Takeaways
- Config must be fully operational (recorder + delivery channel + bucket policy) before rules can be added.  
- Always verify Python dependencies (boto3) before running scripts.  
- Evidence should be lightweight (JSON/CSV) and timestamped to align with audit expectations.  
- Root account controls are best handled with custom evidence scripts.  

## Improvements for Next Time
- Bundle boto3 installation and Python setup into a standard "Step 0" for all scripts.  
- Wrap Python scripts with a shell wrapper to avoid S3 upload attempts when file creation fails.  
- Consider combining non-MFA, root check, and RBAC mapping into a single evidence script to reduce steps.  
- Automate all Week 1 checks into a scheduled Lambda for continuous compliance evidence collection.  
