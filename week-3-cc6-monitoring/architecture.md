```text
+-----------------------------------------------------------------------+
|                          AWS Account – Week 3                         |
|                                                                       |
|   +--------------------+             +----------------------------+   |
|   |  GuardDuty         |             |  VPC Flow Logs             |   |
|   |  - Threat findings |----+        |  - Captures all VPC traffic|   |
|   |  - Event source    |    |        |  - Sent to CloudWatch Logs |   |
|   +---------+----------+    |        +--------------+-------------+   |
|             |               |                       |                 |
|             | GuardDuty Event|                       |                 |
|             v               |                       v                 |
|     +-------------------+   |       +----------------------------+    |
|     |  EventBridge Rule |---+------>|  Lambda: GuardDutyIngestor |    |
|     |  - Source: aws.guardduty     |  - Reads GuardDuty findings |    |
|     |  - Triggers Lambda function  |  - Writes evidence to S3    |    |
|     +---------------+---------------+----------------------------+    |
|                     | EVIDENCE_BUCKET                              |
|                     v                                              |
|        +---------------------------------------------+             |
|        |  S3 Evidence Bucket                         |             |
|        |  - /cc6/guardduty/                          |             |
|        |  - /cc6/monitoring/                         |             |
|        |  Versioned + KMS Encrypted                  |             |
|        +---------------------------------------------+             |
|                                                                       |
|   +----------------+         +-----------------------------+          |
|   |  CloudTrail    |-------->| AWS Config (from Week 0)    |          |
|   |  - API logs    |         | - Compliance history         |          |
|   +----------------+         +-----------------------------+          |
|                                                                       |
|   Combined Controls:                                                  |
|   - CC 6.6.2 Security Monitoring Active                               |
|   - CC 6.6.3 IDS/IPS (GuardDuty + VPC)                                |
|   - CC 6.6.4 Log Aggregation (CloudTrail + CloudWatch)                |
+-----------------------------------------------------------------------+
```
