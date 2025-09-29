# Week 6: Audit Simulation & KPIs

## Controls Covered
- All automated controls (CC6, CC7, CC8, CC9, A-series).

## Learning Objectives
- **CLI**: Create Athena database, run queries over evidence bucket.
- **Python**: Generate KPIs: MFA compliance %, backup success %, GuardDuty findings.
- **Lambda**: Weekly aggregator → produce `metrics.json` in S3.

## Evidence Produced
- `athena-setup.sh` and `athena-queries.sql`.
- `kpi_summary.py` producing metrics summary.
- Weekly `metrics.json` stored in `/metrics/`.
