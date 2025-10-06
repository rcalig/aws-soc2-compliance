+-----------------------------------------------------------------------+
|                             AWS Account                               |
|                                                                       |
|   +-----------------+          +---------------------------+          |
|   | Security Groups |--check-->| sg_public_ports.py        |          |
|   | (Inbound Rules) |          | Generates sg_public_ports.json |     |
|   +-----------------+          +---------------------------+          |
|                                                                       |
|   +-----------------+          +---------------------------+          |
|   | Application LB  |--check-->| alb_tls_check.py          |          |
|   | (Listeners)     |          | Verifies HTTPS/TLS certs  |          |
|   +-----------------+          +---------------------------+          |
|                                                                       |
|   +-----------------+          +---------------------------+          |
|   | CloudFront Dist.|--check-->| cloudfront_tls_check.py   |          |
|   | (Viewer Policy) |          | Ensures HTTPS-only access  |          |
|   +-----------------+          +---------------------------+          |
|                                                                       |
|   +-----------------+          +---------------------------+          |
|   | RDS Instances   |--check-->| rds_check.sh              |          |
|   | (StorageEnc)    |          | Verifies DB encryption    |          |
|   +-----------------+          +---------------------------+          |
|                                                                       |
|   +-----------------+          +---------------------------+          |
|   | S3 Buckets      |--check-->| s3_encryption_check.py    |          |
|   | (SSE Config)    |          | Ensures default encryption|          |
|   +-----------------+          +---------------------------+          |
|                                                                       |
|   +-----------------+          +---------------------------+          |
|   | KMS Keys        |--check-->| kms_rotation_report.sh    |          |
|   | (Rotation)      |          | Lists key rotation status |          |
|   +-----------------+          +---------------------------+          |
|                                                                       |
|   +-----------------+          +---------------------------+          |
|   | EBS Volumes     |--check-->| ebs_check.sh              |          |
|   | (Encryption)    |          | Checks encryption-by-default |       |
|   +-----------------+          +---------------------------+          |
|                                                                       |
|                           +---------------------------+               |
|                           | upload-evidence.sh        |               |
|                           | Uploads all evidence to   |               |
|                           | s3://$EVIDENCE_BUCKET/cc6/|               |
|                           +-----------+---------------+               |
|                                       |                               |
|                                       v                               |
|                           +-----------------------------+             |
|                           | S3 Evidence Bucket          |             |
|                           | (Versioned + KMS Encrypted) |             |
|                           | /cc6/ - Network & Encryption |             |
|                           +---------------+-------------+             |
|                                           |                           |
|                                           v                           |
|                           +-----------------------------+             |
|                           | KMS Key alias/grc-evidence  |             |
|                           | (Encrypts evidence files)   |             |
|                           +-----------------------------+             |
|                                                                       |
+-----------------------------------------------------------------------+
