```text
+-----------------------------------------------------------------------+
|                             AWS Account                               |
|                                                                       |
|  +--------------------+           +----------------------------+      |
|  | IAM Users & Groups |<--------->| AWS Config Rules           |      |
|  | - MFA enabled      |           | - iam-user-mfa-enabled     |      |
|  | - Password policy  |           | - iam-password-policy      |      |
|  | - Group mapping    |           | - iam-user-group-membership|      |
|  | - Root account     |           | - root-account-mfa-enabled |      |
|  +---------+----------+           +---------------+------------+      |
|            |                                            |             |
|            |                                            v             |
|   +--------------------+       +----------------------------------+   |
|   |  boto3 Scripts     |------>| Evidence S3 Bucket (cc6 folders) |   |
|   |  - mfa_check.py    |       | /mfa/, /root/, /password/, /rbac/|   |
|   |  - root_check.py   |       | Versioned + KMS Encrypted         |   |
|   |  - password_policy.py |    +----------------------------------+   |
|   |  - rbac_check.py   |                  ^                         |
|   |  - admin_audit.py  |                  |                         |
|   +--------------------+                  |                         |
|                                           |                         |
|                    +------------------+   |                         |
|                    | KMS Key          |---+  (Encrypts evidence)    |
|                    | alias/grc-evidence |                            |
|                    +------------------+                              |
|                                                                       |
|  +----------------+     +----------------+                            |
|  | CloudTrail     |---->| AWS Config     |                            |
|  | (API activity) |     | (IAM change log)|                           |
|  +----------------+     +----------------+                            |
|                                                                       |
+-----------------------------------------------------------------------+
```
