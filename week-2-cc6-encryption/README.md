# Week 2 – Network & Encryption Compliance

This week focuses on enforcing and validating AWS security controls related to **network security** and **encryption**.  
All scripts generate evidence files that are uploaded to the S3 evidence bucket (`$EVIDENCE_BUCKET`) for audit purposes.

---

## Objectives
- Enforce AWS Config rules for network & encryption.
- Collect evidence for:
  - Inbound port restrictions
  - TLS enforcement on ALB & CloudFront
  - RDS, S3, and EBS encryption
  - KMS key rotation
- Automate evidence upload to S3.

---

## Deliverables
- **Scripts**
  - `sg_public_ports.py` → Security Groups open ports
  - `alb_tls_check.py` → ALB TLS enforcement
  - `cloudfront_tls_check.py` → CloudFront TLS enforcement
  - `rds_check.sh` → RDS encryption status
  - `s3_encryption_check.py` → S3 encryption status
  - `kms_rotation_report.sh` → KMS key rotation status
  - `ebs_check.sh` → EBS encryption status
  - `upload-evidence.sh` → one-click uploader
- **Evidence**
  - JSON/TXT outputs in S3 under `/cc6/`

---

## Mapping to Controls
- CC 6.1.4 – Inbound ports restricted → `sg_public_ports.py`
- CC 6.1.6 – TLS everywhere → `alb_tls_check.py`, `cloudfront_tls_check.py`
- CC 6.1.7 – DB encryption → `rds_check.sh`
- CC 6.1.8 – Key rotation → `kms_rotation_report.sh`
- CC 6.1.10 – Data-at-rest encryption → `s3_encryption_check.py`, `ebs_check.sh`
