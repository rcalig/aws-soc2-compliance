+-----------------------------------------------------------------------+
|                             AWS Account                               |
|                                                                       |
|  +--------------------+             +----------------------------+    |
|  | IAM Users & Groups |<----------->| AWS Config Rules           |    |
|  | - MFA enabled      |             | - iam-user-mfa-enabled     |    |
|  | - Password policy  |             | - iam-password-policy      |    |
|  | - Group mapping    |             | - iam-user-group-membership|    |
|  | - Root account     |             | - root-account-mfa-enabled |    |
|  +---------+----------+             +---------------+------------+    |
|            |                                            |             |
|            |                                            v             |
|   +--------------------+       +----------------------------------+   |
|   |  boto3 Scripts     |------>| Evidence S3 Bucket (cc6 folders) |   |
|   |  - cred_report.py  |       | /mfa/, /root/, /password/, /rbac/|   |
|   |  - mfa_check.py    |       | Versioned + KMS Encrypted         |   |
|   |  - rbac_check.py   |       +----------------------------------+   |
|   |  - admin_audit.py  |                    ^                        |
|   +--------------------+                    |                        |
|                                             |                        |
|                    +------------------+     |                        |
|                    | KMS Key          |-----+  (encrypts evidence)   |
|                    | alias/grc-evidence |                            |
|                    +------------------+                              |
|                                                                       |
|  +----------------+     +----------------+                            |
|  | Lambda         |---->| EventBridge    |                            |
|  | iam-daily-report |   | daily trigger  |                            |
|  +----------------+     +----------------+                            |
|            |                                                |
|            v                                                |
|  +---------------------+                                   |
|  | CloudTrail Logs     |-----------------------------------+
|  | (Root & IAM Events) |  (audit correlation evidence)     |
|  +---------------------+                                   |
|                                                                       |
+-----------------------------------------------------------------------+
