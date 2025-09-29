# Week -1: Setup & Basics

## Purpose
This week sets up the foundation for all future compliance automation:
- Create a secure evidence bucket with versioning and encryption.
- Add a budget guardrail to prevent surprise costs.
- Test Python boto3 access by uploading the first evidence file.
- Create an IAM role and Lambda function for automated evidence collection.

## Controls Covered
- None directly (foundation setup).
- Supports later SOC 2 controls by ensuring evidence is encrypted, versioned, and private.

## Deliverables
- **S3 bucket**: `grc-evidence-<accountid>-<timestamp>` with versioning + KMS encryption.
- **Budget**: FreeTier-Guardrail set at $5 with email alert.
- **Python evidence**: `buckets.json` uploaded to `/bootstrap/`.
- **Lambda**: Hello function writes `hello-<timestamp>.json` into `/bootstrap/`.
- **IAM + KMS**: Lambda role with S3+KMS access, `alias/grc-evidence`.

## Evidence in S3
- `/bootstrap/buckets-YYYY-MM-DD.json`
- `/bootstrap/hello-YYYY-MM-DDTHH-MM-SSZ.json`
