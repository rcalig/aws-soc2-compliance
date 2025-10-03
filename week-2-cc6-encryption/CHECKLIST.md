# Week 2 – Evidence Collection Checklist

## Setup
- [ ] `export AWS_PROFILE=grc-sandbox`
- [ ] `export AWS_REGION=ap-southeast-2`
- [ ] `export EVIDENCE_BUCKET=<your-bucket-name>`

## Config Rules
- [ ] Run `enable-config-rules.sh`
- [ ] Verify rules created with `aws configservice describe-config-rules`

## Evidence Scripts
- [ ] Run `sg_public_ports.py` → generates `sg_public_ports.json`
- [ ] Run `alb_tls_check.py` → generates `alb_tls_check.json`
- [ ] Run `cloudfront_tls_check.py` → generates `cloudfront_tls_check.json`
- [ ] Run `rds_check.sh` → generates `rds_instances.json`
- [ ] Run `s3_encryption_check.py` → generates `s3_encryption.json`
- [ ] Run `kms_rotation_report.sh` → generates `kms_rotation.txt`
- [ ] Run `ebs_check.sh` → generates `ebs_default.json` and `ebs_volumes.json`

## Upload Evidence
- [ ] Run `upload-evidence.sh`
- [ ] Verify uploads with:
  ```bash
  aws s3 ls s3://$EVIDENCE_BUCKET/cc6/ --recursive
