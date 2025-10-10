# AWS SOC 2 Compliance Automation (Beginner-Friendly Labs)

This repository shows how to **automate SOC 2 controls** using **AWS Free Tier**, **AWS CLI**, **Python (boto3)**, and **Lambda**.  
The project is organised into **weekly labs** to build skills step by step.

---

## Learning Goals
- Collect SOC 2 evidence via AWS CLI.
- Parse and enrich evidence with Python.
- Automate pipelines using Lambda + EventBridge.
- Map AWS Config + Security Hub rules directly to SOC 2 controls.
- Produce audit-ready evidence in S3.

---

## Week-by-Week Contents

### Week -1: Setup & Basics
- Create S3 evidence bucket with versioning + KMS.
- Install AWS CLI, Python, boto3.
- First Lambda “Hello World”.

### Week 0: Baseline Logging (CC 6.6.4)
- CloudTrail + AWS Config enabled.
- Lambda pipeline writing events to S3.

### Week 1: Access Controls (CC6)
- CC 6.1.2 MFA enforced
- CC 6.1.3 Strong password policy
- CC 6.1.9 RBAC via groups
- CC 6.2.1 Admin access limited

### Week 2: Network & Encryption (CC6)
- CC 6.1.4 Inbound ports restricted
- CC 6.1.6 TLS everywhere
- CC 6.1.7 DB encryption
- CC 6.1.8 Key rotation
- CC 6.1.10 Data-at-rest encryption

### Week 3: Security Monitoring (CC 6.6.x)
- CC 6.6.2 GuardDuty security monitoring
- CC 6.6.3 IDS/IPS with GuardDuty + VPC Flow Logs
- CC 6.6.4 Log aggregation (CloudTrail + CloudWatch)

### Week 4: Change Management & Code (CC 7 & 8)
- CC 7.2 Network, DAST, Container scans
- CC 8.1.3 Version control RBAC
- CC 8.1.5 Static code scan
- CC 8.1.7 Approved change
- CC 8.1.9 Deploy alerts

### Week 5: Availability (CC 9, A-series)
- CC 9.1.3 Cross-AZ backups
- A 1.1.1 Capacity monitoring
- A 1.1.2 Auto-scaling
- A 1.2.1 Backup failure alerts
- A 1.2.3 Multi-AZ architecture

### Week 6: Audit Simulation & KPIs
- Athena queries for evidence
- KPI summary (MFA compliance, backup success, GuardDuty findings)
- Weekly automated metrics via Lambda

### Out of Scope (Manual)
- C 1.1.3 Data inventory review
- CC 6.7.1 Data-loss prevention
- A 1.2.4/5/6 Physical & BMS controls

---

## How to Use This Repo
1. Clone and follow week-by-week labs.
2. Run CLI scripts to collect evidence.
3. Use Python to parse and enrich evidence.
4. Deploy Lambda for automation.
5. Store all evidence in S3 with clear prefixes (`/cc6/`, `/cc7/`, `/a/`, `/metrics/`).
6. Use Athena/QuickSight for dashboards.

---

## License
MIT License – free for educational use.
