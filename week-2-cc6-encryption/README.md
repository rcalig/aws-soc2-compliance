# Week 2: Network & Encryption

## Controls Covered
- CC 6.1.4 Inbound ports restricted (vpc-sg-open-only-to-authorized-ports).
- CC 6.1.6 TLS everywhere (ELB.1 / CloudFront.1).
- CC 6.1.7 DB encryption (RDS.1).
- CC 6.1.8 Key rotation (kms-key-rotation-enabled).
- CC 6.1.10 Data-at-rest encryption (S3.2 / EBS.1 / RDS.3).

## Learning Objectives
- **CLI**: Check security groups, ELB listeners, RDS encryption, KMS key rotation, and S3 encryption.
- **Python**: Summarize encryption compliance across buckets, volumes, DBs.
- **Lambda**: Trigger on Config NON_COMPLIANT → save violation evidence into S3.

## Evidence Produced
- `sg.json`, `elb-listeners.json`, `rds-encryption.json`, `kms.json`, `s3-encryption.json`.
- `s3-encryption-check.py` outputs JSON with compliant/non-compliant buckets.
- Lambda evidence files in `/cc6/encryption/violations-<date>.json`.
