```text
+-----------------------------------------------------------------------+
|                             AWS Account                               |
|                                                                       |
|  +-----------------+         +-----------------+                      |
|  | CloudTrail      |         | AWS Config      |                      |
|  | (All Regions)   |         | (Recorder +     |                      |
|  | Logs API events |         |  Delivery Ch.)  |                      |
|  +--------+--------+         +--------+--------+                      |
|           |                            |                              |
|           |                            v                              |
|           |             +------------------------------+              |
|           |             | Config Logs S3 Bucket        |              |
|           |             | - Versioned + KMS Encrypted  |              |
|           |             +------------------------------+              |
|           v                                                       |
|  +------------------------------+                                   |
|  | CloudTrail Logs S3 Bucket    |                                   |
|  | - /AWSLogs/<accountid>/...   |                                   |
|  | - Versioned + KMS Encrypted  |                                   |
|  +------------------------------+                                   |
|           |                            |                              |
|           |                            v                              |
|           |              +-----------------------------+              |
|           |              | SNS Topic: config-event-topic|             |
|           |              +--------------+--------------+              |
|           |                             |                             |
|           |                             v                             |
|           |              +-----------------------------+              |
|           |              | Lambda: ConfigEventForwarder|              |
|           |              | - Receives SNS events        |             |
|           |              | - Writes to evidence bucket  |             |
|           |              +-----------------------------+              |
|           |                             |                             |
|           |                             v                             |
|           |              +-----------------------------+              |
|           |              | Evidence S3 Bucket          |              |
|           |              | /cc6/logs/config-event-*.json|             |
|           |              | Versioned + KMS Encrypted   |              |
|           |              +-----------------------------+              |
|           |                             ^                             |
|           |                             |  alias/grc-evidence         |
|           |              +-----------------------------+              |
|           |              | KMS Key (alias/grc-evidence) |             |
|           |              +-----------------------------+              |
|                                                                       |
|  +----------------+                                                  |
|  | IAM Role       |  EvidenceLambdaRole                              |
|  | - S3 + KMS + Logs permissions                                     |
|  +----------------+                                                  |
+-----------------------------------------------------------------------+
```
